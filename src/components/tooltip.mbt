// Tooltip component for displaying contextual information

// Tooltip component with configurable placement, size, color and content

///|
pub fn[M] tooltip(
  content~ : String,
  placement? : @theme.TooltipPlacement = Top,
  size? : @theme.TooltipSize = Md,
  color? : @theme.TooltipColor = Dark,
  arrow? : Bool = true,
  class? : String,
  children~ : @html.Html[M],
) -> @html.Html[M] {
  let trigger_style = @theme.get_tooltip_trigger_style(class?)
  let tooltip_style = @theme.get_tooltip_style(placement~, size~, color~)
  let arrow_style = if arrow {
    @theme.get_tooltip_arrow_style(placement~, color~)
  } else {
    ""
  }
  @html.div(class=trigger_style, [
    // Trigger element
    children,
    // Tooltip content
    @html.div(class=tooltip_style, [
      @html.text(content),
      // Arrow element
      if arrow {
        @html.div(class=arrow_style, [])
      } else {
        @html.text("")
      },
    ]),
  ])
}

// Simple tooltip with just text content

///|
pub fn[M] tooltip_simple(
  content~ : String,
  children~ : @html.Html[M],
) -> @html.Html[M] {
  tooltip(content~, children~)
}

// Tooltip with custom placement

///|
pub fn[M] tooltip_with_placement(
  content~ : String,
  placement~ : @theme.TooltipPlacement,
  children~ : @html.Html[M],
) -> @html.Html[M] {
  tooltip(content~, placement~, children~)
}

// Tooltip with custom color

///|
pub fn[M] tooltip_with_color(
  content~ : String,
  color~ : @theme.TooltipColor,
  children~ : @html.Html[M],
) -> @html.Html[M] {
  tooltip(content~, color~, children~)
}
