///|
/// Creates a configurable textarea component with customizable styling and
/// behavior.
///
/// Parameters:
///
/// * `value` : String - The current value of the textarea.
/// * `on_input` : (String) -> M - The message or action to be dispatched when
///   the textarea content changes.
/// * `placeholder` : String? - The placeholder text to display when the
///   textarea is empty. Defaults to `None`.
/// * `rows` : Int - The number of visible text lines for the textarea.
///   Defaults to `8`.
/// * `size` : @theme.TextareaSize - The size of the textarea. Defaults to
///   `@theme.Md`.
/// * `color` : @theme.TextareaColor - The color theme of the textarea.
///   Defaults to `@theme.Primary`.
/// * `resize` : Bool - Whether the textarea can be resized vertically.
///   Defaults to `false`.
/// * `isError` : Bool - Whether the textarea is in an error state. Defaults
///   to `false`.
/// * `isSuccess` : Bool - Whether the textarea is in a success state.
///   Defaults to `false`.
/// * `disabled` : Bool - Whether the textarea is disabled. Defaults to
///   `false`.
/// * `className` : String? - Additional CSS class name to apply to the
///   textarea. Defaults to `None`.
///
/// Returns an HTML textarea element configured with the specified properties
/// and styling.
///
/// Example:
///
/// ```moonbit skip
/// enum Msg {
///   TextChanged(String)
/// }
/// 
/// let _ = textarea(
///   "Hello World",
///   TextChanged,
///   placeholder=Some("Enter your message..."),
///   rows=5,
///   size=Lg,
///   color=Success,
///   resize=true
/// )
/// ```
///
pub fn[M] textarea(
  value : String,
  on_input : (String) -> M,
  placeholder~ : String? = None,
  rows~ : Int = 8,
  size~ : @theme.TextareaSize = @theme.Md,
  color~ : @theme.TextareaColor = @theme.Primary,
  resize~ : Bool = false,
  isError~ : Bool = false,
  isSuccess~ : Bool = false,
  disabled~ : Bool = false,
  className~ : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_textarea_style(
    size~,
    color~,
    resize~,
    isError~,
    isSuccess~,
    className~,
  )
  
  let base_attrs = [
    @html.attribute("class", klass),
    @html.attribute("rows", rows.to_string()),
    @html.on_input(fn(event) { on_input(event) }),
    @html.attribute("data-error", isError.to_string()),
    @html.attribute("data-success", isSuccess.to_string()),
    @html.attribute("value", value),
  ]
  
  let attrs_with_placeholder = match placeholder {
    Some(ph) => base_attrs + [@html.attribute("placeholder", ph)]
    None => base_attrs
  }
  
  let final_attrs = if disabled {
    attrs_with_placeholder + [@html.attribute("disabled", "true")]
  } else {
    attrs_with_placeholder
  }
  
  @html.node("textarea", final_attrs, [])
}