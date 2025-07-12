///|
/// Creates a text input component with customizable styling and behavior.
///
/// Parameters:
///
/// * `value` : The current value of the input field.
/// * `on_input` : A callback function that handles input events, receiving the
///   new input value as a string.
/// * `placeholder` : Optional placeholder text displayed when the input is
///   empty.
/// * `read_only` : Whether the input is read-only and cannot be modified by the
///   user.
/// * `variant` : The visual variant style of the input (defaults to `Solid`).
/// * `size` : The size of the input component (defaults to `Md`).
/// * `color` : The color theme of the input (defaults to `Primary`).
/// * `is_error` : Whether to display the input in an error state with error
///   styling.
/// * `is_success` : Whether to display the input in a success state with
///   success styling.
/// * `is_pill` : Whether to render the input with pill-shaped (rounded)
///   borders.
/// * `disabled` : Whether the input is disabled and cannot receive user
///   interaction.
/// * `class` : Optional additional CSS class names to apply to the input
///   element.
///
/// Returns an HTML input element configured with the specified properties and
/// styling.
///
///
pub fn[M] input(
  id? : String,
  value : String,
  on_input : (String) -> M,
  placeholder? : String,
  readonly_~ : Bool = false,
  variant~ : @theme.InputVariant = Solid,
  size~ : @theme.InputSize = Md,
  color~ : @theme.InputColor = Primary,
  is_error~ : Bool = false,
  is_success~ : Bool = false,
  is_pill~ : Bool = false,
  disabled~ : Bool = false,
  class? : String
) -> @html.Html[M] {
  let klass = @theme.get_input_style(
    variant~,
    size~,
    color~,
    is_error~,
    is_success~,
    is_pill~,
    disabled~,
    class~,
  )
  @experimental_html.input(
    id?,
    type_="text",
    class=klass,
    on_input=fn(ev) { on_input(ev) },
    value~,
    placeholder?,
    readonly_~,
    disabled~,
    [],
  )
}
