// Popover theme configuration
// Provides styling functions for popover components

// Popover placement options

///|
pub(all) enum PopoverPlacement {
  Top
  TopStart
  TopEnd
  Bottom
  BottomStart
  BottomEnd
  Left
  LeftStart
  LeftEnd
  Right
  RightStart
  RightEnd
}

// Popover size options

///|
pub(all) enum PopoverSize {
  Sm
  Md
  Lg
}

// Popover color options

///|
pub(all) enum PopoverColor {
  Primary
  Secondary
  Success
  Warning
  Error
  Info
  Dark
  Light
}

// Generate CSS classes for popover trigger (focusable element)

///|
pub fn get_popover_trigger_style(class? : String = "") -> String {
  let base_classes = "relative inline-block outline-none focus:outline-2 focus:outline-blue-500 focus:outline-offset-2"
  clsx([base_classes, class])
}

// Generate CSS classes for popover content

///|
pub fn get_popover_content_style(
  placement~ : PopoverPlacement,
  size~ : PopoverSize,
  color~ : PopoverColor,
  class? : String = "",
) -> String {
  let placement_classes = match placement {
    Top => "bottom-full left-1/2 -translate-x-1/2 mb-2"
    TopStart => "bottom-full left-0 mb-2"
    TopEnd => "bottom-full right-0 mb-2"
    Bottom => "top-full left-1/2 -translate-x-1/2 mt-2"
    BottomStart => "top-full left-0 mt-2"
    BottomEnd => "top-full right-0 mt-2"
    Left => "right-full top-1/2 -translate-y-1/2 mr-2"
    LeftStart => "right-full top-0 mr-2"
    LeftEnd => "right-full bottom-0 mr-2"
    Right => "left-full top-1/2 -translate-y-1/2 ml-2"
    RightStart => "left-full top-0 ml-2"
    RightEnd => "left-full bottom-0 ml-2"
  }
  let size_classes = match size {
    Sm => "text-sm p-2 min-w-32 max-w-xs"
    Md => "text-base p-3 min-w-40 max-w-sm"
    Lg => "text-lg p-4 min-w-48 max-w-md"
  }
  let color_classes = match color {
    Primary =>
      "bg-[var(--color-primary)] text-[var(--color-primary-content)] border-[var(--color-primary)]"
    Secondary =>
      "bg-[var(--color-secondary)] text-[var(--color-secondary-content)] border-[var(--color-secondary)]"
    Success =>
      "bg-[var(--color-success)] text-[var(--color-success-content)] border-[var(--color-success)]"
    Warning =>
      "bg-[var(--color-warning)] text-[var(--color-warning-content)] border-[var(--color-warning)]"
    Error =>
      "bg-[var(--color-error)] text-[var(--color-error-content)] border-[var(--color-error)]"
    Info =>
      "bg-[var(--color-info)] text-[var(--color-info-content)] border-[var(--color-info)]"
    Dark => "bg-gray-900 text-white border-gray-700"
    Light => "bg-white text-gray-900 border-gray-200"
  }
  let base_classes = "absolute z-50 rounded-lg border shadow-lg whitespace-normal break-words opacity-0 invisible scale-95 transition-all duration-200 ease-in-out group-focus-within:opacity-100 group-focus-within:visible group-focus-within:scale-100"
  clsx([base_classes, placement_classes, size_classes, color_classes, class])
}

// Generate CSS classes for popover arrow

///|
pub fn get_popover_arrow_style(
  placement~ : PopoverPlacement,
  color~ : PopoverColor,
  class? : String = "",
) -> String {
  let placement_classes = match placement {
    Top | TopStart | TopEnd =>
      "top-full left-1/2 -translate-x-1/2 border-l-transparent border-r-transparent border-b-transparent"
    Bottom | BottomStart | BottomEnd =>
      "bottom-full left-1/2 -translate-x-1/2 border-l-transparent border-r-transparent border-t-transparent"
    Left | LeftStart | LeftEnd =>
      "left-full top-1/2 -translate-y-1/2 border-t-transparent border-b-transparent border-r-transparent"
    Right | RightStart | RightEnd =>
      "right-full top-1/2 -translate-y-1/2 border-t-transparent border-b-transparent border-l-transparent"
  }
  let color_classes = match color {
    Primary => "border-[var(--color-primary)]"
    Secondary => "border-[var(--color-secondary)]"
    Success => "border-[var(--color-success)]"
    Warning => "border-[var(--color-warning)]"
    Error => "border-[var(--color-error)]"
    Info => "border-[var(--color-info)]"
    Dark => "border-gray-900"
    Light => "border-white"
  }
  let base_classes = "absolute w-0 h-0 border-4"
  clsx([base_classes, placement_classes, color_classes, class])
}

// Generate CSS classes for popover container (with show state)

///|
pub fn get_popover_container_style(
  show~ : Bool,
  class? : String = "",
) -> String {
  let state_classes = if show {
    "opacity-100 visible scale-100"
  } else {
    "opacity-0 invisible scale-95"
  }
  clsx([state_classes, class])
}
