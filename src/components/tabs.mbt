///|
/// Creates a configurable tabs component with customizable styling and
/// behavior.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The content to display inside the
///   tabs container, typically TabsList and TabsPanel components.
/// * `defaultValue` : String - The default active tab value.
/// * `orientation` : @theme.TabsOrientation - The orientation of the tabs.
///   Defaults to `@theme.Horizontal`.
/// * `className` : String? - Additional CSS class name to apply to the tabs
///   container. Defaults to `None`.
///
/// Returns an HTML div element configured as a tabs container.
///
/// Example:
///
/// ```moonbit skip
/// let _ = tabs(
///   [tabs_list([...]), tabs_panel([...])],
///   defaultValue="tab1",
///   orientation=Horizontal
/// )
/// ```
///
pub fn[M] tabs(
  children : Array[@html.Html[M]],
  orientation? : @theme.TabsOrientation = @theme.Horizontal,
  class? : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_tabs_style(orientation~, class~)
  let attrs = [
    @html.attribute("class", klass),
    @html.attribute(
      "data-orientation",
      match orientation {
        @theme.Horizontal => "horizontal"
        @theme.Vertical => "vertical"
      },
    ),
  ]
  @html.node("div", attrs, children)
}

///|
/// Creates a tabs list component that contains tab triggers.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The tab trigger elements.
/// * `orientation` : @theme.TabsOrientation - The orientation of the tabs.
///   Defaults to `@theme.Horizontal`.
/// * `variant` : @theme.TabsVariant - The visual variant of the tabs.
///   Defaults to `@theme.Default`.
/// * `className` : String? - Additional CSS class name. Defaults to `None`.
///
/// Returns an HTML div element configured as a tabs list.
///
pub fn[M] tabs_list(
  children : Array[@html.Html[M]],
  orientation? : @theme.TabsOrientation = @theme.Horizontal,
  variant? : @theme.TabsVariant = @theme.Default,
  class? : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_tabs_list_style(orientation~, variant~, class~)
  let attrs = [
    @html.attribute("class", klass),
    @html.attribute("role", "tablist"),
    @html.attribute(
      "aria-orientation",
      match orientation {
        @theme.Horizontal => "horizontal"
        @theme.Vertical => "vertical"
      },
    ),
    @html.attribute(
      "data-orientation",
      match orientation {
        @theme.Horizontal => "horizontal"
        @theme.Vertical => "vertical"
      },
    ),
  ]
  @html.node("div", attrs, children)
}

///|
/// Creates a tab trigger button.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The content to display in the tab.
/// * `value` : String - The unique value for this tab.
/// * `click` : M - The message to dispatch when clicked.
/// * `size` : @theme.TabsSize - The size of the tab. Defaults to `@theme.Md`.
/// * `variant` : @theme.TabsVariant - The visual variant. Defaults to `@theme.Default`.
/// * `isActive` : Bool - Whether this tab is currently active. Defaults to `false`.
/// * `className` : String? - Additional CSS class name. Defaults to `None`.
///
/// Returns an HTML button element configured as a tab trigger.
///
pub fn[M] tabs_trigger(
  children : Array[@html.Html[M]],
  click : M,
  size? : @theme.TabsSize = @theme.Md,
  variant? : @theme.TabsVariant = @theme.Default,
  is_active? : Bool = false,
  class? : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_tabs_trigger_style(
    size~,
    variant~,
    isActive=is_active,
    class~,
  )
  // let attrs = [
  //   @html.attribute("type", "button"),
  //   @html.attribute("role", "tab"),
  //   @html.attribute("class", klass),
  //   @html.attribute("data-active", if is_active { "true" } else { "false" }),
  //   @html.attribute("aria-selected", if is_active { "true" } else { "false" }),
  //   @html.on_click(fn(_) { click }),
  // ]
  @html.button(class=klass, click~, children)
}

///|
/// Creates a tab panel that displays content for a specific tab.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The content to display in the panel.
/// * `value` : String - The value that corresponds to the tab trigger.
/// * `isActive` : Bool - Whether this panel should be visible. Defaults to `false`.
/// * `className` : String? - Additional CSS class name. Defaults to `None`.
///
/// Returns an HTML div element configured as a tab panel, or None if not active.
///
pub fn[M] tabs_panel(
  children : Array[@html.Html[M]],
  is_active? : Bool = false,
  class? : String? = None,
) -> @html.Html[M] {
  if is_active {
    let klass = @theme.get_tabs_panel_style(class~)
    // @html.attribute("role", "tabpanel"),
    @html.div(class=klass, children)
  } else {
    @html.div(class="hidden", children)
  }
}
