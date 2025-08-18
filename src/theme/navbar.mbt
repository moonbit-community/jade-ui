///|
pub(all) enum NavbarVariant {
  Ghost
  Solid
  Outline
  Gradient
}

///|
pub(all) enum NavbarColor {
  Default
  Primary
  Secondary
  Info
  Success
  Warning
  Error
}

///|
pub fn get_navbar_style(
  variant~ : NavbarVariant,
  color~ : NavbarColor,
  shadow~ : Bool,
  blurred~ : Bool,
  fullWidth~ : Bool,
  class~ : String?,
) -> String {
  clsx([
    "w-full flex items-center justify-between px-4 py-2 transition-all duration-300 ease-in-out",
    // Base styles
    if fullWidth {
      "rounded-none"
    } else {
      "rounded-lg"
    },
    // Shadow styles
    if shadow {
      "shadow-lg"
    } else {
      "shadow-none"
    },
    // Blur effect
    if blurred {
      "backdrop-blur-md bg-opacity-80"
    } else {
      ""
    },
    // Variant and color combination styles
    match variant {
      Ghost =>
        match color {
          Default => "bg-[var(--color-base-100)]/10 border-transparent"
          Primary => "bg-[var(--color-primary)]/10 border-transparent"
          Secondary => "bg-[var(--color-secondary)]/10 border-transparent"
          Info => "bg-[var(--color-info)]/10 border-transparent"
          Success => "bg-[var(--color-success)]/10 border-transparent"
          Warning => "bg-[var(--color-warning)]/10 border-transparent"
          Error => "bg-[var(--color-error)]/10 border-transparent"
        }
      Solid =>
        match color {
          Default =>
            "bg-[var(--color-base-100)] border border-[var(--color-base-200)]"
          Primary =>
            "bg-[var(--color-primary)] border border-[var(--color-primary)] text-[var(--color-primary-content)]"
          Secondary =>
            "bg-[var(--color-secondary)] border border-[var(--color-secondary)] text-[var(--color-secondary-content)]"
          Info =>
            "bg-[var(--color-info)] border border-[var(--color-info)] text-[var(--color-info-content)]"
          Success =>
            "bg-[var(--color-success)] border border-[var(--color-success)] text-[var(--color-success-content)]"
          Warning =>
            "bg-[var(--color-warning)] border border-[var(--color-warning)] text-[var(--color-warning-content)]"
          Error =>
            "bg-[var(--color-error)] border border-[var(--color-error)] text-[var(--color-error-content)]"
        }
      Outline =>
        match color {
          Default => "bg-transparent border border-[var(--color-base-200)]"
          Primary =>
            "bg-transparent border border-[var(--color-primary)] text-[var(--color-primary)]"
          Secondary =>
            "bg-transparent border border-[var(--color-secondary)] text-[var(--color-secondary)]"
          Info =>
            "bg-transparent border border-[var(--color-info)] text-[var(--color-info)]"
          Success =>
            "bg-transparent border border-[var(--color-success)] text-[var(--color-success)]"
          Warning =>
            "bg-transparent border border-[var(--color-warning)] text-[var(--color-warning)]"
          Error =>
            "bg-transparent border border-[var(--color-error)] text-[var(--color-error)]"
        }
      Gradient =>
        match color {
          Default =>
            "bg-gradient-to-r from-[var(--color-base-100)] to-[var(--color-base-200)] border border-[var(--color-base-200)]"
          Primary =>
            "bg-gradient-to-r from-[var(--color-primary)] to-[var(--color-primary)]/80 border border-[var(--color-primary)] text-[var(--color-primary-content)]"
          Secondary =>
            "bg-gradient-to-r from-[var(--color-secondary)] to-[var(--color-secondary)]/80 border border-[var(--color-secondary)] text-[var(--color-secondary-content)]"
          Info =>
            "bg-gradient-to-r from-[var(--color-info)] to-[var(--color-info)]/80 border border-[var(--color-info)] text-[var(--color-info-content)]"
          Success =>
            "bg-gradient-to-r from-[var(--color-success)] to-[var(--color-success)]/80 border border-[var(--color-success)] text-[var(--color-success-content)]"
          Warning =>
            "bg-gradient-to-r from-[var(--color-warning)] to-[var(--color-warning)]/80 border border-[var(--color-warning)] text-[var(--color-warning-content)]"
          Error =>
            "bg-gradient-to-r from-[var(--color-error)] to-[var(--color-error)]/80 border border-[var(--color-error)] text-[var(--color-error-content)]"
        }
    },
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}
