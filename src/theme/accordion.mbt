///|
pub(all) enum AccordionVariant {
  Default
  Bordered
  Shadow
  Splitted
}

///|
pub(all) enum AccordionColor {
  Default
  Primary
  Secondary
  Success
  Info
  Warning
  Error
}

///|
pub fn get_accordion_style(
  variant~ : AccordionVariant,
  color~ : AccordionColor,
  className~ : String?,
) -> String {
  clsx([
    // Base styles
    "w-full",
    // Variant styles
    match variant {
      Default => "space-y-0"
      Bordered =>
        "border border-[var(--color-base-200)] rounded-lg overflow-hidden"
      Shadow => "shadow-sm rounded-lg overflow-hidden"
      Splitted => "space-y-2"
    },
    // Color styles (mainly for bordered variant)
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
    match className {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_accordion_item_style(
  variant~ : AccordionVariant,
  disabled~ : Bool,
  className~ : String?,
) -> String {
  clsx([
    // Base styles
    "group w-full",
    // Variant styles
    match variant {
      Default => "border-b border-[var(--color-base-200)] last:border-b-0"
      Bordered => "border-b border-[var(--color-base-200)] last:border-b-0"
      Shadow => "border-b border-[var(--color-base-200)] last:border-b-0"
      Splitted => "border border-[var(--color-base-200)] rounded-lg shadow-sm"
    },
    // Disabled styles
    if disabled {
      "opacity-50 pointer-events-none"
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
pub fn get_accordion_trigger_style(
  color~ : AccordionColor,
  isOpen~ : Bool,
  className~ : String?,
) -> String {
  clsx([
    // Base styles
    "flex items-center justify-between w-full py-4 px-4 text-left font-medium transition-all duration-300 cursor-pointer hover:bg-[var(--color-base-100)]/50",
    // Color styles
    match color {
      Default => "text-[var(--color-base-content)]"
      Primary => "text-[var(--color-primary)] hover:bg-[var(--color-primary)]/5"
      Secondary =>
        "text-[var(--color-secondary)] hover:bg-[var(--color-secondary)]/5"
      Success => "text-[var(--color-success)] hover:bg-[var(--color-success)]/5"
      Info => "text-[var(--color-info)] hover:bg-[var(--color-info)]/5"
      Warning => "text-[var(--color-warning)] hover:bg-[var(--color-warning)]/5"
      Error => "text-[var(--color-error)] hover:bg-[var(--color-error)]/5"
    },
    // Open state styles
    if isOpen {
      "bg-[var(--color-base-100)]/30"
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
pub fn get_accordion_content_style(className~ : String?) -> String {
  clsx([
    // Base styles
    "px-4 text-[var(--color-base-content)]/80 transition-all duration-200 ease-in-out",
    // Optional custom class name
    match className {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_accordion_icon_style(isOpen~ : Bool, className~ : String?) -> String {
  clsx([
    // Base styles
    "transition-transform duration-200 ease-in-out",
    // Rotation based on open state
    if isOpen {
      "rotate-180"
    } else {
      "rotate-0"
    },
    // Optional custom class name
    match className {
      Some(cls) => cls
      None => ""
    },
  ])
}
