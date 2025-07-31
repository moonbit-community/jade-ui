///|
/// Creates a badge component that can be used to display notifications or status indicators.
/// The badge consists of a container with content and an optional indicator.
///
/// Parameters:
///
/// * `children` : Array\[@html.Html\[M]] - The content to wrap with the badge (e.g., button, icon).
/// * `content` : String? - The text content to display in the badge indicator. If None, shows a dot.
/// * `variant` : @theme.BadgeVariant - The visual style variant of the badge. Defaults to `@theme.Solid`.
/// * `size` : @theme.BadgeSize - The size of the badge indicator. Defaults to `@theme.Md`.
/// * `color` : @theme.BadgeColor - The color theme of the badge. Defaults to `@theme.Primary`.
/// * `overlap` : @theme.BadgeOverlap - How the badge overlaps with its content (Circular or Square). Defaults to `@theme.Square`.
/// * `placement` : @theme.BadgePlacement - Where to position the badge indicator. Defaults to `@theme.TopEnd`.
/// * `invisible` : Bool - Whether the badge indicator should be hidden. Defaults to `false`.
/// * `className` : String? - Additional CSS class name to apply to the badge container. Defaults to `None`.
///
/// Returns an HTML div element containing the wrapped content and badge indicator.
///
/// Example:
///
/// ```moonbit skip
/// let _ = badge(
///   [@html.button(class="p-2", [@html.text("Notifications")])],
///   content=Some("5"),
///   variant=Solid,
///   size=Md,
///   color=Error,
///   placement=TopEnd
/// )
/// ```
///
pub fn[M] badge(
  children : Array[@html.Html[M]],
  content~ : String = "",
  variant~ : @theme.BadgeVariant = @theme.Solid,
  size~ : @theme.BadgeSize = @theme.Md,
  color~ : @theme.BadgeColor = @theme.Primary,
  overlap~ : @theme.BadgeOverlap = @theme.Square,
  placement~ : @theme.BadgePlacement = @theme.TopEnd,
  invisible~ : Bool = false,
  className~ : String? = None,
) -> @html.Html[M] {
  let container_style = @theme.get_badge_container_style(className~)
  let indicator_style = @theme.get_badge_indicator_style(
    variant~,
    size~,
    color~,
    overlap~,
    placement~,
    className=None,
  )
  let indicator_content = if content == "" { [] } else { [@html.text(content)] }
  let indicator = if invisible {
    @html.span(class="hidden", indicator_content)
  } else {
    @html.span(class=indicator_style, indicator_content)
  }
  let all_children = Array::new()
  for child in children {
    all_children.push(child)
  }
  all_children.push(indicator)
  @html.div(class=container_style, all_children)
}

///|
/// Creates a simple badge indicator without wrapping content.
/// Useful when you want to position the badge manually.
///
/// Parameters:
///
/// * `content` : String? - The text content to display. If None, shows a dot.
/// * `variant` : @theme.BadgeVariant - The visual style variant. Defaults to `@theme.Solid`.
/// * `size` : @theme.BadgeSize - The size of the badge. Defaults to `@theme.Md`.
/// * `color` : @theme.BadgeColor - The color theme. Defaults to `@theme.Primary`.
/// * `className` : String? - Additional CSS classes. Defaults to `None`.
///
/// Returns an HTML span element styled as a badge indicator.
///
/// Example:
///
/// ```moonbit skip
/// let _ = badge_indicator(
///   content=Some("New"),
///   variant=Solid,
///   color=Success
/// )
/// ```
///
pub fn[M] badge_indicator(
  content~ : String? = None,
  variant~ : @theme.BadgeVariant = @theme.Solid,
  size~ : @theme.BadgeSize = @theme.Md,
  color~ : @theme.BadgeColor = @theme.Primary,
  className~ : String? = None,
) -> @html.Html[M] {
  let base_style = "inline-flex items-center justify-center px-1 py-0.5 text-xs font-medium leading-none rounded-full border"
  let size_style = match size {
    @theme.Sm => "min-w-2 min-h-2 text-xs px-0.5 py-0"
    @theme.Md => "min-w-3 min-h-3 text-xs px-1 py-0.5"
    @theme.Lg => "min-w-4 min-h-4 text-sm px-1.5 py-1"
  }
  let variant_style = match variant {
    @theme.Ghost =>
      match color {
        @theme.Primary =>
          "bg-[var(--color-primary)]/10 border-transparent text-[var(--color-primary)]"
        @theme.Secondary =>
          "bg-[var(--color-secondary)]/10 border-transparent text-[var(--color-secondary)]"
        @theme.Info =>
          "bg-[var(--color-info)]/10 border-transparent text-[var(--color-info)]"
        @theme.Success =>
          "bg-[var(--color-success)]/10 border-transparent text-[var(--color-success)]"
        @theme.Warning =>
          "bg-[var(--color-warning)]/10 border-transparent text-[var(--color-warning)]"
        @theme.Error =>
          "bg-[var(--color-error)]/10 border-transparent text-[var(--color-error)]"
      }
    @theme.Solid =>
      match color {
        @theme.Primary =>
          "bg-[var(--color-primary)] border-[var(--color-primary)] text-[var(--color-primary-content)]"
        @theme.Secondary =>
          "bg-[var(--color-secondary)] border-[var(--color-secondary)] text-[var(--color-secondary-content)]"
        @theme.Info =>
          "bg-[var(--color-info)] border-[var(--color-info)] text-[var(--color-info-content)]"
        @theme.Success =>
          "bg-[var(--color-success)] border-[var(--color-success)] text-[var(--color-success-content)]"
        @theme.Warning =>
          "bg-[var(--color-warning)] border-[var(--color-warning)] text-[var(--color-warning-content)]"
        @theme.Error =>
          "bg-[var(--color-error)] border-[var(--color-error)] text-[var(--color-error-content)]"
      }
    @theme.Outline =>
      match color {
        @theme.Primary =>
          "bg-transparent border-[var(--color-primary)] text-[var(--color-primary)]"
        @theme.Secondary =>
          "bg-transparent border-[var(--color-secondary)] text-[var(--color-secondary)]"
        @theme.Info =>
          "bg-transparent border-[var(--color-info)] text-[var(--color-info)]"
        @theme.Success =>
          "bg-transparent border-[var(--color-success)] text-[var(--color-success)]"
        @theme.Warning =>
          "bg-transparent border-[var(--color-warning)] text-[var(--color-warning)]"
        @theme.Error =>
          "bg-transparent border-[var(--color-error)] text-[var(--color-error)]"
      }
    @theme.Gradient =>
      match color {
        @theme.Primary =>
          "bg-gradient-to-tr from-[var(--color-primary)] to-[var(--color-primary)]/80 border-[var(--color-primary)] text-[var(--color-primary-content)]"
        @theme.Secondary =>
          "bg-gradient-to-tr from-[var(--color-secondary)] to-[var(--color-secondary)]/80 border-[var(--color-secondary)] text-[var(--color-secondary-content)]"
        @theme.Info =>
          "bg-gradient-to-tr from-[var(--color-info)] to-[var(--color-info)]/80 border-[var(--color-info)] text-[var(--color-info-content)]"
        @theme.Success =>
          "bg-gradient-to-tr from-[var(--color-success)] to-[var(--color-success)]/80 border-[var(--color-success)] text-[var(--color-success-content)]"
        @theme.Warning =>
          "bg-gradient-to-tr from-[var(--color-warning)] to-[var(--color-warning)]/80 border-[var(--color-warning)] text-[var(--color-warning-content)]"
        @theme.Error =>
          "bg-gradient-to-tr from-[var(--color-error)] to-[var(--color-error)]/80 border-[var(--color-error)] text-[var(--color-error-content)]"
      }
  }
  let final_style = @theme.clsx([
    base_style,
    size_style,
    variant_style,
    match className {
      Some(cls) => cls
      None => ""
    },
  ])
  let badge_content = match content {
    Some(text) => [@html.text(text)]
    None => []
  }
  @html.span(class=final_style, badge_content)
}
