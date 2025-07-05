# Code Guidelines

## General Naming Conventions

- **Function and Value Names**: `snake_case` is preferred.
- **Type Names**: `CamelCase` is preferred
- **Type parameters**: one character starting from `A` is preferred, e.g, `fn[A,B] Array::map(self : Array[A], f : (A) -> (B)) -> Array[B]`, for some established conventions, `Map[K,V]` it is also accepted.
- **Constants**: `UPPER_SNAKE_CASE` is preferred.

## API Design

- prefer declarative APIs over imperative ones. 

  preferred:
  
  ```mbt
  fn button[M](text : String, on_click : M, icon? : Icon) -> Html[M]
  ```
  
  not preferred:
  
  ```mbt
  fn Button::new() -> Button
  fn Button::on_click(self : Button, on_click : (Event) -> Unit) -> Unit
  fn Button::set_text(self : Button, text : String) -> Unit
  fn Button::set_icon(self : Button, icon : Icon) -> Unit
  fn Button::render(self : Button) -> Html[Callback]
  ```

- support composability


## Keep Code Robust

- Handle all cases

  Avoid partial match in pattern matching. If you need to encoding an invariant, use `guard` and `is` instead.

  Always validate inputs and outputs when interfacing with JavaScript. Ensure that your code handles `null` and `undefined` values explicitly to avoid unexpected behavior or runtime errors.

- Use informative type annotations 

  Use `String` only for text. For JSON, use `Json`. For other cases, prefer enums or descriptive types for clarity and maintainability.


## Keep Code Simple

- Fast and efficient abstractions are preferred over *theoretically perfect* abstractions.

- Favor clarity over cleverness

  Write code that is slightly more verbose but easier to understand, rather than relying on intricate or obscure techniques that may hinder readability.

- Minimize dependencies

  Avoid adding dependencies or extra build steps that are not strictly necessary. If a functionality can be easily implemented in MoonBit, prefer implementing it directly rather than relying on a FFI.







