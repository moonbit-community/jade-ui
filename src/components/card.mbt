///|
pub fn[M] card(
  children : Array[@html.Html[M]],
  variant~ : @theme.CardVariant = Solid,
  color~ : @theme.CardColor = Default,
  className~ : String? = None
) -> Html[M] {
  let card_style = @theme.get_card_style(variant~, color~, className~)
  let attrs = [@html.attribute("class", card_style)]
  @html.node("div", attrs, children)
}

///|
pub fn[M] card_header(
  children : Array[@html.Html[M]],
  className~ : String? = None
) -> Html[M] {
  let header_style = @theme.get_card_header_style(className~)
  let attrs = [@html.attribute("class", header_style)]
  @html.node("div", attrs, children)
}

///|
pub fn[M] card_body(
  children : Array[@html.Html[M]],
  className~ : String? = None
) -> Html[M] {
  let body_style = @theme.get_card_body_style(className~)
  @html.div(class=body_style, children)
}

///|
pub fn[M] card_footer(
  children : Array[@html.Html[M]],
  className~ : String? = None
) -> Html[M] {
  let footer_style = @theme.get_card_footer_style(className~)
  @html.div(class=footer_style, children)
}
