///|
/// Creates a configurable chip component with customizable styling and
/// behavior.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The content to display inside the
///   chip, such as text, icons, or dismiss triggers.
/// * `variant` : @theme.ChipVariant - The visual style variant of the chip.
///   Defaults to `@theme.Solid`.
/// * `size` : @theme.ChipSize - The size of the chip. Defaults to
///   `@theme.Md`.
/// * `color` : @theme.ChipColor - The color theme of the chip. Defaults to
///   `@theme.Primary`.
/// * `isPill` : Bool - Whether the chip should have a pill shape (rounded).
///   Defaults to `true`.
/// * `className` : String? - Additional CSS class name to apply to the chip.
///   Defaults to `None`.
///
/// Returns an HTML div element configured with the specified properties and
/// styling.
///
/// Example:
///
/// ```moonbit skip
/// let _ = chip(
///   [chip_label(["Success"])],
///   variant=Solid,
///   size=Md,
///   color=Success,
///   isPill=true
/// )
/// ```
///
pub fn[M] chip(
  children : Array[@html.Html[M]],
  variant~ : @theme.ChipVariant = @theme.Solid,
  size~ : @theme.ChipSize = @theme.Md,
  color~ : @theme.ChipColor = @theme.Primary,
  isPill~ : Bool = true,
  class~ : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_chip_style(variant~, size~, color~, isPill~, class~)
  @html.div(class=klass, children)
}

///|
/// Creates a chip label component for displaying text content within a chip.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The text content to display.
/// * `size` : @theme.ChipSize - The size of the chip label. Defaults to
///   `@theme.Md`.
/// * `className` : String? - Additional CSS class name to apply to the label.
///   Defaults to `None`.
///
/// Returns an HTML span element with appropriate styling for chip labels.
///
/// Example:
///
/// ```moonbit skip
/// let _ = chip_label(
///   [@html.text("Label Text")],
///   size=Lg
/// )
/// ```
///
pub fn[M] chip_label(
  children : Array[@html.Html[M]],
  size~ : @theme.ChipSize = @theme.Md,
  className~ : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_chip_label_style(size~, className~)
  @html.span(class=klass, children)
}

///|
/// Creates a chip icon component for displaying icons within a chip.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The icon content to display.
/// * `size` : @theme.ChipSize - The size of the chip icon. Defaults to
///   `@theme.Md`.
/// * `className` : String? - Additional CSS class name to apply to the icon.
///   Defaults to `None`.
///
/// Returns an HTML span element with appropriate styling for chip icons.
///
/// Example:
///
/// ```moonbit skip
/// let _ = chip_icon(
///   [svg_icon_content],
///   size=Sm
/// )
/// ```
///
pub fn[M] chip_icon(
  children : Array[@html.Html[M]],
  size~ : @theme.ChipSize = @theme.Md,
  className~ : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_chip_icon_style(size~, className~)
  let attrs = [@html.attribute("class", klass)]
  @html.node("span", attrs, children)
}

///|
/// Creates a chip dismiss trigger component for removing/dismissing chips.
///
/// Parameters:
///
/// * `click` : M - The message or action to be dispatched when the dismiss
///   trigger is clicked.
/// * `size` : @theme.ChipSize - The size of the dismiss trigger. Defaults to
///   `@theme.Md`.
/// * `className` : String? - Additional CSS class name to apply to the trigger.
///   Defaults to `None`.
/// * `children` : Array\[@html.Html\[M]]? - Optional custom content for the
///   dismiss trigger. If not provided, a default X icon will be used.
///
/// Returns an HTML button element with appropriate styling and click handling.
///
/// Example:
///
/// ```moonbit skip
/// enum Msg {
///   RemoveChip
/// }
/// 
/// let _ = chip_dismiss_trigger(
///   RemoveChip,
///   size=Md
/// )
/// ```
///
pub fn[M] chip_dismiss_trigger(
  click : M,
  size~ : @theme.ChipSize = @theme.Md,
  class~ : String? = None,
  children~ : Array[@svg.Svg[M]]? = None,
) -> @html.Html[M] {
  let klass = @theme.get_chip_dismiss_trigger_style(size~, className=class)
  let default_icon = [
    @svg.node(
      "svg",
      [
        @svg.attribute("viewBox", "0 0 24 24"),
        @svg.attribute("fill", "none"),
        @svg.attribute("xmlns", "http://www.w3.org/2000/svg"),
        @svg.attribute("color", "currentColor"),
        @svg.attribute("class", "h-full w-full"),
      ],
      [
        @svg.node(
          "path",
          [
            @svg.attribute(
              "d", "M6.75827 17.2426L12.0009 12M17.2435 6.75736L12.0009 12M12.0009 12L6.75827 6.75736M12.0009 12L17.2435 17.2426",
            ),
            @svg.attribute("stroke", "currentColor"),
            @svg.attribute("stroke-linecap", "round"),
            @svg.attribute("stroke-linejoin", "round"),
          ],
          [],
        ),
      ],
    ),
  ]
  let content : Array[@vdom.Node[M]] = children.unwrap_or(default_icon)
  @html.button(class=klass, click~, content)
}
