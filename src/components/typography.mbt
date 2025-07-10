///|
pub fn[M] typography(
  tag~ : @theme.TypographyType = @theme.P,
  color~ : @theme.TypographyColor = @theme.Inherit,
  class~ : String = "",
  childrens : Array[@html.Html[M]]
) -> @html.Html[M] {
  let style = @theme.get_typography_style(tag, color, class)
  match tag {
    H1 => @html.h1(class=style, childrens)
    H2 => @html.h2(class=style, childrens)
    H3 => @html.h3(class=style, childrens)
    H4 => @html.h4(class=style, childrens)
    H5 => @html.h5(class=style, childrens)
    H6 => @html.h6(class=style, childrens)
    Lead => @html.p(class=style, childrens)
    P => @html.p(class=style, childrens)
    Small => @html.p(class=style, childrens)
  }
}
