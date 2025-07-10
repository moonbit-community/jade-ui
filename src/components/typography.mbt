///|
pub fn[M] typography(
  tag~ : @theme.TypographyType = @theme.P,
  color~ : @theme.TypographyColor = @theme.Inherit,
  class~ : String = "",
  childrens : Array[@html.Html[M]]
) -> @html.Html[M] {
  let style = @theme.get_typography_style(tag, color, class)
  let tag = @theme.get_typography_tag(tag)
  let attrs = [@html.attribute("class", style)]
  @html.node(tag, attrs, childrens)
}
