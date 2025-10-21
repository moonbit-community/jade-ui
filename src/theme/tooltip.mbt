// Tooltip component theme configuration

// Tooltip placement variants

///|
pub(all) enum TooltipPlacement {
  Top
  Bottom
  Left
  Right
}

// Tooltip size variants

///|
pub(all) enum TooltipSize {
  Sm
  Md
  Lg
}

// Tooltip color variants (reusing existing color system from JadeTheme)

///|
pub(all) enum TooltipColor {
  Primary
  Secondary
  Success
  Warning
  Error
  Info
  Dark
  Light
}

// Generate CSS classes for tooltip styling

///|
pub fn get_tooltip_style(
  placement~ : TooltipPlacement,
  size~ : TooltipSize,
  color~ : TooltipColor,
  class? : String = "",
) -> String {
  let placement_classes = match placement {
    Top => "bottom-full left-1/2 -translate-x-1/2 mb-2"
    Bottom => "top-full left-1/2 -translate-x-1/2 mt-2"
    Left => "right-full top-1/2 -translate-y-1/2 mr-2"
    Right => "left-full top-1/2 -translate-y-1/2 ml-2"
  }
  let size_classes = match size {
    Sm => "text-xs px-2 py-1"
    Md => "text-sm px-3 py-1.5"
    Lg => "text-base px-4 py-2"
  }
  let color_classes = match color {
    Primary => "bg-[var(--color-primary)] text-[var(--color-primary-content)]"
    Secondary =>
      "bg-[var(--color-secondary)] text-[var(--color-secondary-content)]"
    Success => "bg-[var(--color-success)] text-[var(--color-success-content)]"
    Warning => "bg-[var(--color-warning)] text-[var(--color-warning-content)]"
    Error => "bg-[var(--color-error)] text-[var(--color-error-content)]"
    Info => "bg-[var(--color-info)] text-[var(--color-info-content)]"
    Dark => "bg-gray-900 text-white"
    Light => "bg-white text-gray-900 border border-gray-200"
  }
  let base_classes = "absolute z-50 rounded-md font-medium shadow-lg whitespace-nowrap pointer-events-none opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 ease-in-out"
  clsx([base_classes, placement_classes, size_classes, color_classes, class])
}

// Generate CSS classes for tooltip trigger

///|
pub fn get_tooltip_trigger_style(class? : String = "") -> String {
  let base_classes = "relative inline-block group"
  clsx([base_classes, class])
}

// Generate CSS for tooltip arrow

///|
pub fn get_tooltip_arrow_style(
  placement~ : TooltipPlacement,
  color~ : TooltipColor,
) -> String {
  let arrow_position = match placement {
    Top =>
      "top-full left-1/2 -translate-x-1/2 border-t-4 border-l-4 border-r-4 border-b-0 border-l-transparent border-r-transparent"
    Bottom =>
      "bottom-full left-1/2 -translate-x-1/2 border-b-4 border-l-4 border-r-4 border-t-0 border-l-transparent border-r-transparent"
    Left =>
      "left-full top-1/2 -translate-y-1/2 border-l-4 border-t-4 border-b-4 border-r-0 border-t-transparent border-b-transparent"
    Right =>
      "right-full top-1/2 -translate-y-1/2 border-r-4 border-t-4 border-b-4 border-l-0 border-t-transparent border-b-transparent"
  }
  let arrow_color = match color {
    Primary =>
      match placement {
        Top => "border-t-[var(--color-primary)]"
        Bottom => "border-b-[var(--color-primary)]"
        Left => "border-l-[var(--color-primary)]"
        Right => "border-r-[var(--color-primary)]"
      }
    Secondary =>
      match placement {
        Top => "border-t-[var(--color-secondary)]"
        Bottom => "border-b-[var(--color-secondary)]"
        Left => "border-l-[var(--color-secondary)]"
        Right => "border-r-[var(--color-secondary)]"
      }
    Success =>
      match placement {
        Top => "border-t-[var(--color-success)]"
        Bottom => "border-b-[var(--color-success)]"
        Left => "border-l-[var(--color-success)]"
        Right => "border-r-[var(--color-success)]"
      }
    Warning =>
      match placement {
        Top => "border-t-[var(--color-warning)]"
        Bottom => "border-b-[var(--color-warning)]"
        Left => "border-l-[var(--color-warning)]"
        Right => "border-r-[var(--color-warning)]"
      }
    Error =>
      match placement {
        Top => "border-t-[var(--color-error)]"
        Bottom => "border-b-[var(--color-error)]"
        Left => "border-l-[var(--color-error)]"
        Right => "border-r-[var(--color-error)]"
      }
    Info =>
      match placement {
        Top => "border-t-[var(--color-info)]"
        Bottom => "border-b-[var(--color-info)]"
        Left => "border-l-[var(--color-info)]"
        Right => "border-r-[var(--color-info)]"
      }
    Dark =>
      match placement {
        Top => "border-t-gray-900"
        Bottom => "border-b-gray-900"
        Left => "border-l-gray-900"
        Right => "border-r-gray-900"
      }
    Light =>
      match placement {
        Top => "border-t-white"
        Bottom => "border-b-white"
        Left => "border-l-white"
        Right => "border-r-white"
      }
  }
  let base_classes = "absolute w-0 h-0"
  clsx([base_classes, arrow_position, arrow_color])
}
