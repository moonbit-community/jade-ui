///|
/// Creates a configurable button group component that groups multiple buttons
/// together with consistent styling and behavior.
///
/// Parameters:
///
/// * `children` : Array[@html.Html[M]] - The button elements to group together.
/// * `variant` : @theme.ButtonGroupVariant - The visual style variant for all buttons.
///   Defaults to `@theme.Solid`.
/// * `size` : @theme.ButtonGroupSize - The size for all buttons. Defaults to
///   `@theme.Md`.
/// * `color` : @theme.ButtonGroupColor - The color theme for all buttons. Defaults to
///   `@theme.Primary`.
/// * `orientation` : @theme.ButtonGroupOrientation - The layout orientation.
///   Defaults to `@theme.Horizontal`.
/// * `fullWidth` : Bool - Whether the button group should take the full width.
///   Defaults to `false`.
/// * `ripple` : Bool - Whether to enable ripple effect on button interactions.
///   Defaults to `true`.
/// * `isPill` : Bool - Whether buttons should have pill-shaped corners.
///   Defaults to `false`.
/// * `class` : String? - Additional CSS class name to apply to the group.
///   Defaults to `None`.
///
/// Returns an HTML div element containing the grouped buttons with appropriate
/// styling for seamless connection.
///
/// Example:
///
/// ```moonbit skip
/// enum Msg {
///   FirstAction
///   SecondAction
///   ThirdAction
/// }
/// 
/// let buttons = [
///   button([text("First")], FirstAction),
///   button([text("Second")], SecondAction),
///   button([text("Third")], ThirdAction)
/// ]
/// 
/// let _ = button_group(
///   buttons,
///   variant=Outlined,
///   size=Lg,
///   color=Primary,
///   orientation=Horizontal
/// )
/// ```
///
pub fn[M] button_group(
  children : Array[@html.Html[M]],
  orientation? : @theme.ButtonGroupOrientation = @theme.Horizontal,
  fullWidth? : Bool = false,
  class? : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_button_group_style(orientation~, fullWidth~, class~)
  // let variant_str = match variant {
  //   @theme.Ghost => "ghost"
  //   @theme.Outlined => "outlined"
  //   @theme.Solid => "solid"
  //   @theme.Gradient => "gradient"
  // }
  // let orientation_str = match orientation {
  //   @theme.Horizontal => "horizontal"
  //   @theme.Vertical => "vertical"
  // }
  // let attrs = [
  //   @html.attribute("class", klass),
  //   @html.attribute("data-variant", variant_str),
  //   @html.attribute("data-orientation", orientation_str),
  //   @html.attribute("data-shape", if isPill { "pill" } else { "default" }),
  //   @html.attribute("data-width", if fullWidth { "full" } else { "default" }),
  // ]
  @html.div(class=klass, children)
}
