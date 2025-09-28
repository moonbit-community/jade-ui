///|
/// Breadcrumb variant types for different visual styles
pub(all) enum BreadcrumbVariant {
  Default
  Bordered
  Underlined
}

///|
/// Breadcrumb color themes
pub(all) enum BreadcrumbColor {
  Default
  Primary
  Secondary
  Success
  Info
  Warning
  Error
}

///|
/// Breadcrumb size options
pub(all) enum BreadcrumbSize {
  Sm
  Md
  Lg
}

///|
/// Get breadcrumb container styles
pub fn get_breadcrumb_style(
  variant~ : BreadcrumbVariant,
  color~ : BreadcrumbColor,
  size~ : BreadcrumbSize,
  class~ : String?,
) -> String {
  clsx([
    // Base styles
    "flex flex-wrap items-center",
    // Size styles
    match size {
      Sm => "gap-1 text-xs"
      Md => "gap-1.5 text-sm"
      Lg => "gap-2 text-base"
    },
    // Variant styles
    match variant {
      Default => "p-1"
      Bordered => "p-2 border rounded-md border-[var(--color-base-300)]"
      Underlined => "p-1 border-b border-[var(--color-base-300)]"
    },
    // Color styles (mainly affects border color for variants)
    match (variant, color) {
      (Bordered, Primary) => "border-[var(--color-primary)]/20"
      (Bordered, Secondary) => "border-[var(--color-secondary)]/20"
      (Bordered, Success) => "border-[var(--color-success)]/20"
      (Bordered, Info) => "border-[var(--color-info)]/20"
      (Bordered, Warning) => "border-[var(--color-warning)]/20"
      (Bordered, Error) => "border-[var(--color-error)]/20"
      (Underlined, Primary) => "border-[var(--color-primary)]/30"
      (Underlined, Secondary) => "border-[var(--color-secondary)]/30"
      (Underlined, Success) => "border-[var(--color-success)]/30"
      (Underlined, Info) => "border-[var(--color-info)]/30"
      (Underlined, Warning) => "border-[var(--color-warning)]/30"
      (Underlined, Error) => "border-[var(--color-error)]/30"
      _ => ""
    },
    // Custom class
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
/// Get breadcrumb link styles
pub fn get_breadcrumb_link_style(
  color~ : BreadcrumbColor,
  isActive~ : Bool,
  class~ : String?,
) -> String {
  clsx([
    // Base styles
    "inline-flex items-center transition-colors duration-200 ease-in-out",
    // Active/inactive states
    if isActive {
      "font-medium cursor-default"
    } else {
      "hover:underline cursor-pointer"
    },
    // Color styles
    if isActive {
      "text-[var(--color-base-content)]"
    } else {
      match color {
        Default =>
          "text-[var(--color-base-content)]/70 hover:text-[var(--color-base-content)]"
        Primary =>
          "text-[var(--color-primary)] hover:text-[var(--color-primary)]/80"
        Secondary =>
          "text-[var(--color-secondary)] hover:text-[var(--color-secondary)]/80"
        Success =>
          "text-[var(--color-success)] hover:text-[var(--color-success)]/80"
        Info => "text-[var(--color-info)] hover:text-[var(--color-info)]/80"
        Warning =>
          "text-[var(--color-warning)] hover:text-[var(--color-warning)]/80"
        Error => "text-[var(--color-error)] hover:text-[var(--color-error)]/80"
      }
    },
    // Custom class
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
/// Get breadcrumb separator styles
pub fn get_breadcrumb_separator_style(class~ : String?) -> String {
  clsx([
    // Base styles
    "inline-block select-none pointer-events-none opacity-50 text-[var(--color-base-content)]",
    // Custom class
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}
