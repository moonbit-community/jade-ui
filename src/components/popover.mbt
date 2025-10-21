// Popover component implementation
// Provides popover functionality with trigger and content

// Simple popover with default settings

///|
pub fn[M] popover(
  content~ : String,
  children~ : @html.Html[M],
  placement? : @theme.PopoverPlacement = Bottom,
  size? : @theme.PopoverSize = Md,
  color? : @theme.PopoverColor = Dark,
  arrow? : Bool = true,
  class? : String = "",
) -> @html.Html[M] {
  let trigger_style = @theme.get_popover_trigger_style()
  let content_style = @theme.get_popover_content_style(
    placement~,
    size~,
    color~,
  )
  let arrow_style = @theme.get_popover_arrow_style(placement~, color~)

  // Use div with tabindex and :focus-within for proper focus management
  @html.node(
    "div",
    [
      @html.attribute("class", @theme.clsx([trigger_style, "group", class])),
      @html.attribute("tabindex", "0"), // Make focusable
    ],
    [
      // Trigger element
      @html.div(class="cursor-pointer", [children]),

      // Popover content (shown on focus-within)
      @html.div(class=content_style, [
        @html.text(content),
        // Arrow element
        if arrow {
          @html.node("div", [@html.attribute("class", arrow_style)], [])
        } else {
          @html.text("")
        },
      ]),
    ],
  )
}
