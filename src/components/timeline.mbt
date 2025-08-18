///|
/// Creates a timeline container component that can display a sequence of events
/// or steps in either horizontal or vertical orientation.
///
/// Parameters:
///
/// * `children` : Array[@html.Html[M]] - The timeline items to display.
/// * `orientation` : @theme.TimelineOrientation - The layout orientation.
///   Defaults to `@theme.Vertical`.
/// * `mode` : @theme.TimelineMode - The display mode (Timeline or Stepper).
///   Defaults to `@theme.Timeline`.
/// * `color` : @theme.TimelineColor - The color theme. Defaults to `@theme.Primary`.
/// * `className` : String? - Additional CSS class name. Defaults to `None`.
///
/// Returns an HTML div element configured as a timeline container.
///
/// Example:
///
/// ```moonbit skip
/// let _ = timeline([
///   timeline_item([@html.text("Step 1")], value="1"),
///   timeline_item([@html.text("Step 2")], value="2"),
///   timeline_item([@html.text("Step 3")], value="3")
/// ], orientation=Horizontal, mode=Stepper)
/// ```
///
pub fn[M] timeline(
  children : Array[@html.Html[M]],
  orientation~ : @theme.TimelineOrientation = @theme.Vertical,
  mode~ : @theme.TimelineMode = @theme.Timeline,
  color~ : @theme.TimelineColor = @theme.Primary,
  className~ : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_timeline_style(orientation~, className~)
  let attrs = [
    @html.attribute("class", klass),
    @html.attribute(
      "data-orientation",
      match orientation {
        @theme.Horizontal => "horizontal"
        @theme.Vertical => "vertical"
      },
    ),
    @html.attribute(
      "data-mode",
      match mode {
        @theme.Timeline => "timeline"
        @theme.Stepper => "stepper"
      },
    ),
    @html.attribute(
      "data-color",
      match color {
        @theme.Primary => "primary"
        @theme.Secondary => "secondary"
        @theme.Info => "info"
        @theme.Success => "success"
        @theme.Warning => "warning"
        @theme.Error => "error"
      },
    ),
  ]
  @html.node("div", attrs, children)
}

///|
/// Creates a timeline item component that represents a single step or event
/// in the timeline.
///
/// Parameters:
///
/// * `children` : Array[@html.Html[M]] - The content to display in the timeline item.
/// * `value` : String - A unique identifier for this timeline item.
/// * `icon` : Array[@html.Html[M]] - Optional icon content. Defaults to empty array.
/// * `orientation` : @theme.TimelineOrientation - The layout orientation.
///   Defaults to `@theme.Vertical`.
/// * `color` : @theme.TimelineColor - The color theme. Defaults to `@theme.Primary`.
/// * `isActive` : Bool - Whether this item is currently active. Defaults to `false`.
/// * `isCompleted` : Bool - Whether this item is completed. Defaults to `false`.
/// * `showSeparator` : Bool? - Whether to show separator line. Defaults to `None` (auto: `true` for vertical, `false` for horizontal).
/// * `className` : String? - Additional CSS class name. Defaults to `None`.
///
/// Returns an HTML div element configured as a timeline item.
///
/// Example:
///
/// ```moonbit skip
/// let _ = timeline_item(
///   [@html.text("Order Placed")],
///   value="order-placed",
///   icon=[@html.text("1")],
///   isCompleted=true
/// )
/// ```
///
pub fn[M] timeline_item(
  children : Array[@html.Html[M]],
  value : String,
  icon~ : Array[@html.Html[M]] = [],
  orientation~ : @theme.TimelineOrientation = @theme.Vertical,
  color~ : @theme.TimelineColor = @theme.Primary,
  isActive~ : Bool = false,
  isCompleted~ : Bool = false,
  showSeparator~ : Bool? = None,
  class~ : String? = None,
) -> @html.Html[M] {
  let itemKlass = @theme.get_timeline_item_style(
    orientation~,
    isActive~,
    isCompleted~,
    class~,
  )
  let headerKlass = @theme.get_timeline_header_style(orientation~, class=None)
  let iconKlass = @theme.get_timeline_icon_style(
    color~,
    isActive~,
    isCompleted~,
    className=None,
  )
  let bodyKlass = @theme.get_timeline_body_style(orientation~, className=None)
  let separatorKlass = @theme.get_timeline_separator_style(
    orientation~,
    color~,
    isCompleted~,
    class=None,
  )
  let iconContent = if icon.length() > 0 { icon } else { [@html.text("●")] }
  let headerElement = @html.node(
    "div",
    [@html.attribute("class", headerKlass)],
    [@html.node("div", [@html.attribute("class", iconKlass)], iconContent)],
  )
  let bodyElement = @html.node(
    "div",
    [@html.attribute("class", bodyKlass)],
    children,
  )
  let actualShowSeparator = match showSeparator {
    Some(value) => value
    None => match orientation {
      @theme.Vertical => true
      @theme.Horizontal => false
    }
  }
  let separatorElement = if actualShowSeparator {
    match orientation {
      @theme.Vertical => [@html.node("div", [@html.attribute("class", separatorKlass)], [])]
      @theme.Horizontal => []
    }
  } else {
    []
  }
  let itemChildren = match orientation {
    @theme.Horizontal => [headerElement, bodyElement]
    @theme.Vertical => [headerElement, bodyElement] + separatorElement
  }
  let attrs = [
    @html.attribute("class", itemKlass),
    @html.attribute("data-value", value),
    @html.attribute("data-active", if isActive { "true" } else { "false" }),
    @html.attribute(
      "data-completed",
      if isCompleted {
        "true"
      } else {
        "false"
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
  @html.node("div", attrs, itemChildren)
}

///|
/// Creates a timeline header component that can contain an icon or step indicator.
///
/// Parameters:
///
/// * `children` : Array[@html.Html[M]] - The content to display in the header.
/// * `orientation` : @theme.TimelineOrientation - The layout orientation.
///   Defaults to `@theme.Vertical`.
/// * `className` : String? - Additional CSS class name. Defaults to `None`.
///
/// Returns an HTML div element configured as a timeline header.
///
pub fn[M] timeline_header(
  children : Array[@html.Html[M]],
  orientation~ : @theme.TimelineOrientation = @theme.Vertical,
  className~ : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_timeline_header_style(orientation~, class=className)
  let attrs = [@html.attribute("class", klass)]
  @html.node("div", attrs, children)
}

///|
/// Creates a timeline icon component with customizable styling based on state.
///
/// Parameters:
///
/// * `children` : Array[@html.Html[M]] - The icon content to display.
/// * `color` : @theme.TimelineColor - The color theme. Defaults to `@theme.Primary`.
/// * `isActive` : Bool - Whether this icon is currently active. Defaults to `false`.
/// * `isCompleted` : Bool - Whether this icon represents a completed state. Defaults to `false`.
/// * `className` : String? - Additional CSS class name. Defaults to `None`.
///
/// Returns an HTML div element configured as a timeline icon.
///
pub fn[M] timeline_icon(
  children : Array[@html.Html[M]],
  color~ : @theme.TimelineColor = @theme.Primary,
  isActive~ : Bool = false,
  isCompleted~ : Bool = false,
  className~ : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_timeline_icon_style(
    color~,
    isActive~,
    isCompleted~,
    className~,
  )
  let attrs = [@html.attribute("class", klass)]
  @html.node("div", attrs, children)
}

///|
/// Creates a timeline separator component that connects timeline items.
///
/// Parameters:
///
/// * `orientation` : @theme.TimelineOrientation - The layout orientation.
///   Defaults to `@theme.Vertical`.
/// * `color` : @theme.TimelineColor - The color theme. Defaults to `@theme.Primary`.
/// * `isCompleted` : Bool - Whether this separator represents a completed connection.
///   Defaults to `false`.
/// * `className` : String? - Additional CSS class name. Defaults to `None`.
///
/// Returns an HTML div element configured as a timeline separator.
///
pub fn[M] timeline_separator(
  orientation~ : @theme.TimelineOrientation = @theme.Vertical,
  color~ : @theme.TimelineColor = @theme.Primary,
  isCompleted~ : Bool = false,
  className~ : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_timeline_separator_style(
    orientation~,
    color~,
    isCompleted~,
    class=className,
  )
  let attrs = [@html.attribute("class", klass)]
  @html.node("div", attrs, [])
}

///|
/// Creates a timeline body component that contains the main content of a timeline item.
///
/// Parameters:
///
/// * `children` : Array[@html.Html[M]] - The content to display in the body.
/// * `orientation` : @theme.TimelineOrientation - The layout orientation.
///   Defaults to `@theme.Vertical`.
/// * `className` : String? - Additional CSS class name. Defaults to `None`.
///
/// Returns an HTML div element configured as a timeline body.
///
pub fn[M] timeline_body(
  children : Array[@html.Html[M]],
  orientation~ : @theme.TimelineOrientation = @theme.Vertical,
  className~ : String? = None,
) -> @html.Html[M] {
  let klass = @theme.get_timeline_body_style(orientation~, className~)
  let attrs = [@html.attribute("class", klass)]
  @html.node("div", attrs, children)
}
