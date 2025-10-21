///|
/// Creates a card component with customizable styling and content.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The HTML content to be displayed
///   inside the card.
/// * `variant` : @theme.CardVariant - The visual variant of the card (defaults
///   to `Solid`).
/// * `color` : @theme.CardColor - The color scheme of the card (defaults to
///   `Default`).
/// * `class` : String? - Optional additional CSS classes to apply to the
///   card.
///
/// Returns an HTML div element styled as a card containing the specified
/// children.
///
/// Example:
///
/// ```moonbit skip
/// let _ : @html.Html[Unit] = @components.card(
///   [@html.text("Hello, World!")],
///   variant=@theme.Outlined,
///   color=@theme.Primary,
///   class=Some("my-custom-class")
/// )
/// ```
///
pub fn[M] card(
  children : Array[@html.Html[M]],
  variant? : @theme.CardVariant = Solid,
  color? : @theme.CardColor = Default,
  class? : String,
) -> Html[M] {
  let card_style = @theme.get_card_style(variant~, color~, class?)
  let attrs = [@html.attribute("class", card_style)]
  @html.node("div", attrs, children)
}

///|
/// Creates a header section for a card component with customizable styling.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The HTML content to be displayed
///   inside the card header.
/// * `class` : String? - Optional additional CSS classes to apply to the
///   card header (defaults to `None`).
///
/// Returns an HTML div element styled as a card header containing the specified
/// children.
///
/// Example:
///
/// ```moonbit skip
/// let _ : @html.Html[Unit] = @components.card_header(
///   [@html.text("Card Title")],
///   class=Some("custom-header-style")
/// )
/// ```
///
pub fn[M] card_header(
  children : Array[@html.Html[M]],
  class? : String? = None,
) -> Html[M] {
  let header_style = @theme.get_card_header_style(class~)
  let attrs = [@html.attribute("class", header_style)]
  @html.node("div", attrs, children)
}

///|
/// Creates a card body component that wraps content in the main content area of
/// a card.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The HTML content to be displayed
///   inside the card body.
/// * `class` : String? - Optional additional CSS classes to apply to the
///   card body (defaults to `None`).
///
/// Returns an HTML div element styled as a card body containing the specified
/// children.
///
/// Example:
///
/// ```moonbit skip
/// let body_content : Array[@html.Html[Unit]] = [@html.text("This is the main content of the card.")]
/// let my_card_body = @components.card_body(
///   body_content,
///   class=Some("custom-body-style")
/// )
/// ignore(my_card_body)
/// ```
///
pub fn[M] card_body(
  children : Array[@html.Html[M]],
  class? : String? = None,
) -> Html[M] {
  let body_style = @theme.get_card_body_style(class~)
  @html.div(class=body_style, children)
}

///|
/// Creates a footer section for a card component with customizable styling.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The HTML content to be displayed
///   inside the card footer.
/// * `class` : String? - Optional additional CSS classes to apply to the
///   footer (defaults to `None`).
///
/// Returns an HTML div element styled as a card footer containing the specified
/// children.
///
/// Example:
///
/// ```moonbit skip
/// let footer_content = [@html.text("© 2024 My Company")]
/// let my_footer = @components.card_footer(
///   footer_content,
///   class=Some("text-center")
/// )
/// ```
///
pub fn[M] card_footer(
  children : Array[@html.Html[M]],
  class? : String? = None,
) -> Html[M] {
  let footer_style = @theme.get_card_footer_style(class~)
  @html.div(class=footer_style, children)
}
