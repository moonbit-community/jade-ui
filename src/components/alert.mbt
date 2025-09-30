///|
/// Creates a configurable alert component for displaying important messages
/// and notifications.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The content to display inside the
///   alert, such as text, icons, or other elements.
/// * `variant` : @theme.AlertVariant - The visual style variant of the alert.
///   Defaults to `@theme.Solid`.
/// * `color` : @theme.AlertColor - The color theme of the alert. Defaults to
///   `@theme.Info`.
/// * `dismissible` : Bool - Whether the alert can be dismissed by the user.
///   Defaults to `false`.
/// * `icon` : @html.Html\[M]? - Optional icon to display at the beginning of
///   the alert. Defaults to `None`.
/// * `class` : String? - Additional CSS class name to apply to the alert.
///   Defaults to `None`.
///
/// Returns an HTML div element configured with the specified properties and
/// styling.
///
/// Example:
///
/// ```moonbit skip
/// enum Msg {
///   DismissAlert
/// }
/// 
/// let _ = alert(
///   [@html.text("This is an important message!")],
///   variant=Outlined,
///   color=Success,
///   dismissible=true,
///   icon=Some(@html.text("✓"))
/// )
/// ```
///
pub fn[M] alert(
  children : Array[@html.Html[M]],
  variant? : @theme.AlertVariant = @theme.Solid,
  color? : @theme.AlertColor = @theme.Info,
  dismissible? : Bool = false,
  icon? : @html.Html[M]? = None,
  class? : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_alert_style(variant~, color~, dismissible~, class~)
  let content = []

  // Add icon if provided
  match icon {
    Some(icon_element) => {
      let icon_wrapper = @html.node(
        "span",
        [@html.attribute("class", @theme.get_alert_icon_style())],
        [icon_element],
      )
      content.push(icon_wrapper)
    }
    None => ()
  }

  // Add main content
  let content_wrapper = @html.node(
    "div",
    [@html.attribute("class", @theme.get_alert_content_style())],
    children,
  )
  content.push(content_wrapper)

  // Add dismiss button if dismissible
  if dismissible {
    let dismiss_button = @html.node(
      "button",
      [
        @html.attribute("type", "button"),
        @html.attribute("class", @theme.get_alert_dismiss_style()),
        @html.attribute("aria-label", "Dismiss alert"),
      ],
      [
        @html.node(
          "svg",
          [
            @html.attribute("class", "w-4 h-4"),
            @html.attribute("fill", "none"),
            @html.attribute("stroke", "currentColor"),
            @html.attribute("viewBox", "0 0 24 24"),
          ],
          [
            @html.node(
              "path",
              [
                @html.attribute("stroke-linecap", "round"),
                @html.attribute("stroke-linejoin", "round"),
                @html.attribute("stroke-width", "2"),
                @html.attribute("d", "M6 18L18 6M6 6l12 12"),
              ],
              [],
            ),
          ],
        ),
      ],
    )
    content.push(dismiss_button)
  }
  let attrs = [
    @html.attribute("role", "alert"),
    @html.attribute("class", klass),
  ]
  @html.node("div", attrs, content)
}

///|
/// Creates a simple alert with just text content.
///
/// Parameters:
///
/// * `text` : String - The text message to display in the alert.
/// * `variant` : @theme.AlertVariant - The visual style variant of the alert.
///   Defaults to `@theme.Solid`.
/// * `color` : @theme.AlertColor - The color theme of the alert. Defaults to
///   `@theme.Info`.
/// * `dismissible` : Bool - Whether the alert can be dismissed by the user.
///   Defaults to `false`.
/// * `class` : String? - Additional CSS class name to apply to the alert.
///   Defaults to `None`.
///
/// Returns an HTML div element with the text content.
///
/// Example:
///
/// ```moonbit skip
/// let _ = alert_text(
///   "Operation completed successfully!",
///   variant=Ghost,
///   color=Success
/// )
/// ```
///
pub fn[M] alert_text(
  text : String,
  variant? : @theme.AlertVariant = @theme.Solid,
  color? : @theme.AlertColor = @theme.Info,
  dismissible? : Bool = false,
  class? : String? = None,
) -> @html.Html[M] {
  alert([@html.text(text)], variant~, color~, dismissible~, class~)
}
