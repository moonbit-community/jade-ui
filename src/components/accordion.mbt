///|
/// Creates a configurable accordion component that allows users to show and hide
/// sections of related content.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The accordion items to display.
/// * `variant` : @theme.AccordionVariant - The visual style variant of the accordion.
///   Defaults to `@theme.Default`.
/// * `color` : @theme.AccordionColor - The color theme of the accordion.
///   Defaults to `@theme.Default`.
/// * `className` : String? - Additional CSS class name to apply to the accordion.
///   Defaults to `None`.
///
/// Returns an HTML div element configured as an accordion container.
///
/// Example:
///
/// ```moonbit skip
/// let _ = accordion([
///   accordion_item(
///     "item1",
///     accordion_trigger([text("Section 1")], ToggleItem("item1")),
///     accordion_content([text("Content for section 1")])
///   )
/// ])
/// ```
///
pub fn[M] accordion(
  children : Array[@html.Html[M]],
  variant~ : @theme.AccordionVariant = @theme.Default,
  color~ : @theme.AccordionColor = @theme.Default,
  className~ : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_accordion_style(variant~, color~, className~)
  let attrs = [
    @html.attribute("class", klass),
    @html.attribute("role", "tablist"),
  ]
  @html.node("div", attrs, children)
}

///|
/// Creates an accordion item that contains a trigger and content section.
///
/// Parameters:
///
/// * `value` : String - Unique identifier for this accordion item.
/// * `trigger` : @html.Html[M] - The clickable header element.
/// * `content` : @html.Html[M] - The collapsible content element.
/// * `variant` : @theme.AccordionVariant - The visual style variant.
/// * `color` : @theme.AccordionColor - The color theme.
/// * `disabled` : Bool - Whether this item is disabled.
/// * `className` : String? - Additional CSS class name.
///
/// Returns an HTML div element configured as an accordion item.
///
pub fn[M] accordion_item(
  value : String,
  trigger : @html.Html[M],
  content : @html.Html[M],
  variant~ : @theme.AccordionVariant = @theme.Default,
  disabled~ : Bool = false,
  class~ : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_accordion_item_style(
    variant~,
    disabled~,
    className=class,
  )
  let attrs = [
    @html.attribute("class", klass),
    @html.attribute("data-value", value),
    @html.attribute("data-disabled", if disabled { "true" } else { "false" }),
  ]
  @html.node("div", attrs, [trigger, content])
}

///|
/// Creates an accordion trigger (header) that can be clicked to toggle content.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The content to display in the trigger.
/// * `click` : M - The message to dispatch when clicked.
/// * `isOpen` : Bool - Whether the associated content is currently open.
/// * `variant` : @theme.AccordionVariant - The visual style variant.
/// * `color` : @theme.AccordionColor - The color theme.
/// * `showIcon` : Bool - Whether to show the expand/collapse icon.
/// * `class` : String? - Additional CSS class name.
///
/// Returns an HTML button element configured as an accordion trigger.
///
pub fn[M] accordion_trigger(
  children : Array[@html.Html[M]],
  click : M,
  isOpen~ : Bool = false,
  color~ : @theme.AccordionColor = @theme.Default,
  showIcon~ : Bool = true,
  class~ : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_accordion_trigger_style(
    color~,
    isOpen~,
    className=class,
  )
  let icon = if showIcon {
    let iconClass = @theme.get_accordion_icon_style(isOpen~, className=None)
    [
      @svg.node(
        "svg",
        [
          @svg.attribute("class", iconClass),
          @svg.attribute("width", "16"),
          @svg.attribute("height", "16"),
          @svg.attribute("viewBox", "0 0 24 24"),
          @svg.attribute("fill", "none"),
          @svg.attribute("stroke", "currentColor"),
          @svg.attribute("stroke-width", "2"),
        ],
        [
          @svg.node("polyline", [@svg.attribute("points", "6,9 12,15 18,9")], []),
        ],
      ).inner(),
    ]
  } else {
    []
  }
  let attrs = [
    @html.attribute("type", "button"),
    @html.attribute("class", klass),
    @html.attribute("aria-expanded", if isOpen { "true" } else { "false" }),
    @html.attribute("role", "tab"),
    @html.on_click(fn(_) { click }),
  ]
  let all_children = Array::new()
  for child in children {
    all_children.push(child)
  }
  for icon_elem in icon {
    all_children.push(icon_elem)
  }
  @html.node("button", attrs, all_children)
}

///|
/// Creates accordion content that can be shown or hidden.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The content to display when expanded.
/// * `isOpen` : Bool - Whether the content is currently visible.
/// * `variant` : @theme.AccordionVariant - The visual style variant.
/// * `className` : String? - Additional CSS class name.
///
/// Returns an HTML div element configured as accordion content, or None if closed.
///
pub fn[M] accordion_content(
  children : Array[@html.Html[M]],
  isOpen~ : Bool = false,
  class~ : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_accordion_content_style(className=class)
  let attrs = [
    @html.attribute("class", klass),
    @html.attribute("role", "tabpanel"),
    @html.attribute("data-open", if isOpen { "true" } else { "false" }),
    @html.attribute(
      "style",
      if isOpen {
        "display: block;"
      } else {
        "display: none;"
      },
    ),
  ]
  @html.node("div", attrs, children)
}
