///|
pub fn[M] button(text : String, click? : M) -> @html.Html[M] {
  @html.button([@html.text(text)], click?)
}
