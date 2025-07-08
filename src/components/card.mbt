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
/// * `className` : String? - Optional additional CSS classes to apply to the
///   card.
///
/// Returns an HTML div element styled as a card containing the specified
/// children.
///
/// Example:
///
/// ```moonbit skip
/// let card_content = [@html.text("Hello, World!")]
/// let my_card = @components.card(
///   card_content,
///   variant=@theme.Outlined,
///   color=@theme.Primary,
///   className=Some("my-custom-class")
/// )
/// ```
///
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
/// Creates a header section for a card component with customizable styling.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The HTML content to be displayed
///   inside the card header.
/// * `className` : String? - Optional additional CSS classes to apply to the
///   card header (defaults to `None`).
///
/// Returns an HTML div element styled as a card header containing the specified
/// children.
///
/// Example:
///
/// ```moonbit skip
/// let header_content = [@html.text("Card Title")]
/// let my_card_header = @components.card_header(
///   header_content,
///   className=Some("custom-header-style")
/// )
/// ```
///
pub fn[M] card_header(
  children : Array[@html.Html[M]],
  className~ : String? = None
) -> Html[M] {
  let header_style = @theme.get_card_header_style(className~)
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
/// * `className` : String? - Optional additional CSS classes to apply to the
///   card body (defaults to `None`).
///
/// Returns an HTML div element styled as a card body containing the specified
/// children.
///
/// Example:
///
/// ```moonbit skip
/// let body_content = [@html.text("This is the main content of the card.")]
/// let my_card_body = @components.card_body(
///   body_content,
///   className=Some("custom-body-style")
/// )
/// ```
///
pub fn[M] card_body(
  children : Array[@html.Html[M]],
  className~ : String? = None
) -> Html[M] {
  let body_style = @theme.get_card_body_style(className~)
  @html.div(class=body_style, children)
}

///|
/// Creates a footer section for a card component with customizable styling.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The HTML content to be displayed
///   inside the card footer.
/// * `className` : String? - Optional additional CSS classes to apply to the
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
///   className=Some("text-center")
/// )
/// ignore(my_footer)
/// ```
///
pub fn[M] card_footer(
  children : Array[@html.Html[M]],
  className~ : String? = None
) -> Html[M] {
  let footer_style = @theme.get_card_footer_style(className~)
  @html.div(class=footer_style, children)
}
