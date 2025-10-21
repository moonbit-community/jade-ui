///|
/// Creates a configurable button component with customizable styling and
/// behavior.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The content to display inside the
///   button, such as text or icons.
/// * `click` : M - The message or action to be dispatched when the button is
///   clicked.
/// * `variant` : @theme.ButtonVariant - The visual style variant of the button.
///   Defaults to `@theme.Solid`.
/// * `size` : @theme.ButtonSize - The size of the button. Defaults to
///   `@theme.Md`.
/// * `color` : @theme.ButtonColor - The color theme of the button. Defaults to
///   `@theme.Primary`.
/// * `fullWidth` : Bool - Whether the button should take the full width of its
///   container. Defaults to `false`.
/// * `ripple` : Bool - Whether to enable ripple effect on button interactions.
///   Defaults to `true`.
/// * `class` : String? - Additional CSS class name to apply to the button.
///   Defaults to `None`.
///
/// Returns an HTML button element configured with the specified properties and
/// styling.
///
/// Example:
///
/// ```moonbit skip
/// enum Msg {
///   MyClickMsg
/// }
/// 
/// let _ = button(
///   [@html.text("Click Me")],
///   MyClickMsg,
///   variant=Outlined,
///   size=Lg,
///   color=Success,
///   fullWidth=true
/// )
/// ```
///
pub fn[M] button(
  children : Array[@html.Html[M]],
  click : M,
  variant? : @theme.ButtonVariant = @theme.Solid,
  size? : @theme.ButtonSize = @theme.Md,
  color? : @theme.ButtonColor = @theme.Primary,
  full_width? : Bool = false,
  ripple? : Bool = true,
  class? : String,
) -> @html.Html[M] {
  let klass = @theme.get_button_style(
    variant~,
    size~,
    color~,
    fullWidth=full_width,
    ripple~,
    class~,
  )
  let attrs = [
    @html.attribute("type", "button"),
    @html.on_click(fn(_) { click }),
    @html.attribute("class", klass),
  ]
  @html.node("button", attrs, children)
}
