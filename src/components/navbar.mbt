///|
/// Creates a navbar component with customizable styling and content.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The HTML content to be displayed
///   inside the navbar.
/// * `variant` : @theme.NavbarVariant - The visual variant of the navbar (defaults
///   to `Solid`).
/// * `color` : @theme.NavbarColor - The color scheme of the navbar (defaults to
///   `Default`).
/// * `shadow` : Bool - Whether to add shadow to the navbar (defaults to `true`).
/// * `blurred` : Bool - Whether to add blur backdrop effect (defaults to `false`).
/// * `fullWidth` : Bool - Whether to make navbar full width without border radius (defaults to `false`).
/// * `className` : String? - Optional additional CSS classes to apply to the
///   navbar.
///
/// Returns an HTML nav element styled as a navbar containing the specified
/// children.
///
/// Example:
///
/// ```moonbit skip
/// let _ : @html.Html[Unit] = @components.navbar(
///   [@html.text("My App"), @html.div([], [])],
///   variant=@theme.Solid,
///   color=@theme.Primary,
///   shadow=true,
///   class=Some("my-custom-class")
/// )
/// ```
///
pub fn[M] navbar(
  children : Array[@html.Html[M]],
  variant? : @theme.NavbarVariant = Solid,
  color? : @theme.NavbarColor = Default,
  shadow? : Bool = true,
  blurred? : Bool = false,
  fullWidth? : Bool = false,
  class? : String? = None,
) -> Html[M] {
  let navbar_style = @theme.get_navbar_style(
    variant~,
    color~,
    shadow~,
    blurred~,
    fullWidth~,
    class~,
  )
  let attrs = [@html.attribute("class", navbar_style)]
  @html.node("nav", attrs, children)
}
