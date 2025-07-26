///|
pub(all) enum MenuVariant {
  Default
  Bordered
  Shadow
}

///|
pub(all) enum MenuColor {
  Default
  Primary
  Secondary
  Success
  Info
  Warning
  Error
}

///|
pub(all) enum MenuPlacement {
  Top
  TopStart
  TopEnd
  Right
  RightStart
  RightEnd
  Bottom
  BottomStart
  BottomEnd
  Left
  LeftStart
  LeftEnd
}

///|
pub fn get_menu_style(
  variant~ : MenuVariant,
  color~ : MenuColor,
  class~ : String?,
) -> String {
  clsx([
    // Base styles
    "relative inline-block",
    // Variant styles
    match variant {
      Default => ""
      Bordered => "border border-[var(--color-base-200)] rounded-lg"
      Shadow => "shadow-lg rounded-lg"
    },
    // Color styles
    match (variant, color) {
      (Bordered, Primary) => "border-[var(--color-primary)]/20"
      (Bordered, Secondary) => "border-[var(--color-secondary)]/20"
      (Bordered, Success) => "border-[var(--color-success)]/20"
      (Bordered, Info) => "border-[var(--color-info)]/20"
      (Bordered, Warning) => "border-[var(--color-warning)]/20"
      (Bordered, Error) => "border-[var(--color-error)]/20"
      _ => ""
    },
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_menu_trigger_style(
  color~ : MenuColor,
  isOpen~ : Bool,
  className~ : String?,
) -> String {
  clsx([
    // Base styles
    "inline-flex items-center justify-center px-4 py-2 text-sm font-medium transition-all duration-200 cursor-pointer border rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2",
    // Color styles
    match color {
      Default =>
        "bg-white text-[var(--color-base-content)] border-[var(--color-base-200)] hover:bg-[var(--color-base-100)] focus:ring-[var(--color-base-300)]"
      Primary =>
        "bg-[var(--color-primary)] text-[var(--color-primary-content)] border-[var(--color-primary)] hover:bg-[var(--color-primary)]/90 focus:ring-[var(--color-primary)]/50"
      Secondary =>
        "bg-[var(--color-secondary)] text-[var(--color-secondary-content)] border-[var(--color-secondary)] hover:bg-[var(--color-secondary)]/90 focus:ring-[var(--color-secondary)]/50"
      Success =>
        "bg-[var(--color-success)] text-[var(--color-success-content)] border-[var(--color-success)] hover:bg-[var(--color-success)]/90 focus:ring-[var(--color-success)]/50"
      Info =>
        "bg-[var(--color-info)] text-[var(--color-info-content)] border-[var(--color-info)] hover:bg-[var(--color-info)]/90 focus:ring-[var(--color-info)]/50"
      Warning =>
        "bg-[var(--color-warning)] text-[var(--color-warning-content)] border-[var(--color-warning)] hover:bg-[var(--color-warning)]/90 focus:ring-[var(--color-warning)]/50"
      Error =>
        "bg-[var(--color-error)] text-[var(--color-error-content)] border-[var(--color-error)] hover:bg-[var(--color-error)]/90 focus:ring-[var(--color-error)]/50"
    },
    // Open state styles
    if isOpen {
      "ring-2 ring-offset-2"
    } else {
      ""
    },
    // Optional custom class name
    match className {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_menu_content_style(
  variant~ : MenuVariant,
  placement~ : MenuPlacement,
  className~ : String?,
) -> String {
  clsx([
    // Base styles
    "absolute z-50 min-w-[8rem] overflow-hidden bg-white border border-[var(--color-base-200)] rounded-md shadow-lg",
    // Variant styles
    match variant {
      Default => ""
      Bordered => "border-2"
      Shadow => "shadow-xl"
    },
    // Placement styles
    match placement {
      Top => "bottom-full mb-1 left-0"
      TopStart => "bottom-full mb-1 left-0"
      TopEnd => "bottom-full mb-1 right-0"
      Right => "left-full ml-1 top-0"
      RightStart => "left-full ml-1 top-0"
      RightEnd => "left-full ml-1 bottom-0"
      Bottom => "top-full mt-1 left-0"
      BottomStart => "top-full mt-1 left-0"
      BottomEnd => "top-full mt-1 right-0"
      Left => "right-full mr-1 top-0"
      LeftStart => "right-full mr-1 top-0"
      LeftEnd => "right-full mr-1 bottom-0"
    },
    // Optional custom class name
    match className {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_menu_item_style(
  disabled~ : Bool,
  selected~ : Bool,
  ripple~ : Bool,
  class~ : String?,
) -> String {
  clsx([
    // Base styles
    "block w-full px-4 py-2 text-sm text-left transition-colors duration-200 cursor-pointer",
    // Ripple styles
    if ripple {
      "relative overflow-hidden"
    } else {
      ""
    },
    // State styles
    if disabled {
      "opacity-50 cursor-not-allowed text-[var(--color-base-content)]/50"
    } else if selected {
      "bg-[var(--color-primary)]/10 text-[var(--color-primary)] font-medium"
    } else {
      "text-[var(--color-base-content)] hover:bg-[var(--color-base-100)] hover:text-[var(--color-base-content)]"
    },
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_menu_separator_style(class~ : String?) -> String {
  clsx([
    // Base styles
    "my-1 border-t border-[var(--color-base-200)]",
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}
