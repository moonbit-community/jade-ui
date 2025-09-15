///|
pub fn[M] typography(
  tag? : @theme.TypographyType = @theme.P,
  color? : @theme.TypographyColor = @theme.Inherit,
  class? : String = "",
  children : Array[@html.Html[M]],
) -> @html.Html[M] {
  let style = @theme.get_typography_style(tag, color, class)
  match tag {
    H1 => @html.h1(class=style, children)
    H2 => @html.h2(class=style, children)
    H3 => @html.h3(class=style, children)
    H4 => @html.h4(class=style, children)
    H5 => @html.h5(class=style, children)
    H6 => @html.h6(class=style, children)
    Lead => @html.p(class=style, children)
    P => @html.p(class=style, children)
    Small => @html.p(class=style, children)
  }
}
