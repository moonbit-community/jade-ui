///|
/// Creates a configurable menu component that displays a list of choices on temporary surfaces.
/// It appears when users interact with a trigger element and provides a consistent user experience.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The menu content including trigger and menu items.
/// * `variant` : @theme.MenuVariant - The visual style variant of the menu.
///   Defaults to `@theme.Default`.
/// * `color` : @theme.MenuColor - The color theme of the menu.
///   Defaults to `@theme.Default`.
/// * `className` : String? - Additional CSS class name to apply to the menu.
///   Defaults to `None`.
///
/// Returns an HTML div element configured as a menu container.
///
/// Example:
///
/// ```moonbit skip
/// let _ = menu([
///   menu_trigger([text("Options")], ToggleMenu),
///   menu_content([
///     menu_item([text("Edit")], EditAction),
///     menu_item([text("Delete")], DeleteAction)
///   ])
/// ])
/// ```
///
pub fn[M] menu(
  children : Array[@html.Html[M]],
  variant? : @theme.MenuVariant = @theme.Default,
  color? : @theme.MenuColor = @theme.Default,
  className? : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_menu_style(variant~, color~, class=className)
  let attrs = [@html.attribute("class", klass), @html.attribute("role", "menu")]
  @html.node("div", attrs, children)
}

///|
/// Creates a menu trigger that can be clicked to open/close the menu.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The content to display in the trigger.
/// * `click` : M - The message to dispatch when clicked.
/// * `isOpen` : Bool - Whether the menu is currently open.
/// * `color` : @theme.MenuColor - The color theme of the trigger.
/// * `showIcon` : Bool - Whether to show a dropdown icon.
/// * `className` : String? - Additional CSS class name.
///
/// Returns an HTML button element configured as a menu trigger.
///
pub fn[M] menu_trigger(
  children : Array[@html.Html[M]],
  click : M,
  isOpen? : Bool = false,
  color? : @theme.MenuColor = @theme.Default,
  showIcon? : Bool = true,
  className? : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_menu_trigger_style(color~, isOpen~, className~)
  let iconClass = "ml-2 h-4 w-4 transition-transform duration-200 " +
    (if isOpen { "rotate-180" } else { "rotate-0" })
  let icon = if showIcon {
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
      ).0,
    ]
  } else {
    []
  }
  let attrs = [
    @html.attribute("type", "button"),
    @html.attribute("class", klass),
    @html.attribute("aria-expanded", if isOpen { "true" } else { "false" }),
    @html.attribute("aria-haspopup", "true"),
    @html.on_click(fn(_) { click }),
  ]
  let all_children : Array[@html.Html[M]] = Array::new()
  for child in children {
    all_children.push(child)
  }
  for icon_elem in icon {
    all_children.push(icon_elem)
  }
  @html.node("button", attrs, all_children)
}

///|
/// Creates menu content that contains the menu items.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The menu items to display.
/// * `isOpen` : Bool - Whether the menu content is currently visible.
/// * `variant` : @theme.MenuVariant - The visual style variant.
/// * `placement` : @theme.MenuPlacement - The position of the menu relative to trigger.
/// * `className` : String? - Additional CSS class name.
///
/// Returns an HTML div element configured as menu content, or None if closed.
///
pub fn[M] menu_content(
  children : Array[@html.Html[M]],
  isOpen? : Bool = false,
  variant? : @theme.MenuVariant = @theme.Default,
  placement? : @theme.MenuPlacement = @theme.Bottom,
  className? : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_menu_content_style(variant~, placement~, className~)
  @html.div(
    class=klass,
    style=[if isOpen { "display:block" } else { "display:none" }],
    children,
  )
}

///|
/// Creates a menu item that can be clicked to perform an action.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The content to display in the item.
/// * `click` : M - The message to dispatch when clicked.
/// * `disabled` : Bool - Whether the item is disabled.
/// * `selected` : Bool - Whether the item is currently selected.
/// * `className` : String? - Additional CSS class name.
///
/// Returns an HTML button element configured as a menu item.
///
pub fn[M] menu_item(
  children : Array[@html.Html[M]],
  click : M,
  disabled? : Bool = false,
  selected? : Bool = false,
  ripple? : Bool = true,
  className? : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_menu_item_style(
    disabled~,
    selected~,
    ripple~,
    class=className,
  )
  let attrs = [
    @html.attribute("type", "button"),
    @html.attribute("class", klass),
    @html.attribute("role", "menuitem"),
    @html.attribute("aria-disabled", if disabled { "true" } else { "false" }),
    @html.attribute("tabindex", if disabled { "-1" } else { "0" }),
  ]
  let click_attrs = if disabled {
    []
  } else {
    [@html.on_click(fn(_) { click })]
  }
  let final_attrs = Array::new()
  for attr in attrs {
    final_attrs.push(attr)
  }
  for attr in click_attrs {
    final_attrs.push(attr)
  }
  @html.node("button", final_attrs, children)
}

///|
/// Creates a menu separator to visually group menu items.
///
/// Parameters:
///
/// * `className` : String? - Additional CSS class name.
///
/// Returns an HTML hr element configured as a menu separator.
///
pub fn[M] menu_separator(className? : String? = None) -> @html.Html[M] {
  let klass = @theme.get_menu_separator_style(class=className)
  let attrs = [
    @html.attribute("class", klass),
    @html.attribute("role", "separator"),
  ]
  @html.node("hr", attrs, [])
}
