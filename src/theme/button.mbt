///|
pub(all) enum ButtonVariant {
  Ghost
  Outlined
  Solid
  Gradient
}

///|
pub(all) enum ButtonSize {
  Xs
  Sm
  Md
  Lg
  Xl
}

///|
pub(all) enum ButtonColor {
  Primary
  Secondary
  Info
  Success
  Warning
  Error
}

///|
pub fn get_button_style(
  variant~ : ButtonVariant,
  size~ : ButtonSize,
  color~ : ButtonColor,
  fullWidth~ : Bool,
  ripple~ : Bool,
  className~ : String?
) -> String {
  clsx([
    "cursor-pointer inline-flex items-center justify-center border align-middle select-none font-sans font-medium text-center transition-all duration-300 ease-in disabled:opacity-50 disabled:shadow-none disabled:cursor-not-allowed data-[shape=pill]:rounded-full data-[width=full]:w-full focus:shadow-none",
    // Size styles
    match size {
      Xs => "text-sm rounded-md py-1 px-2 shadow-sm hover:shadow"
      Sm => "text-sm rounded-md py-1.5 px-3 shadow-sm hover:shadow"
      Md => "text-sm rounded-md py-2 px-4 shadow-sm hover:shadow-md"
      Lg => "text-base rounded-md py-2.5 px-5 shadow-sm hover:shadow-lg"
      Xl => "text-base rounded-lg py-3 px-6 shadow-sm hover:shadow-lg"
    },
    // Variant and color combination styles
    match variant {
      Ghost =>
        match color {
          Primary =>
            "bg-transparent border-transparent text-[var(--color-primary)] hover:bg-[var(--color-primary)]/5 hover:border-[var(--color-primary)]/5 shadow-none hover:shadow-none"
          Secondary =>
            "bg-transparent border-transparent text-[var(--color-secondary)] hover:bg-[var(--color-secondary)]/10 hover:border-[var(--color-secondary)]/10 shadow-none hover:shadow-none"
          Info =>
            "bg-transparent border-transparent text-[var(--color-info)] hover:bg-[var(--color-info)]/10 hover:border-[var(--color-info)]/10 shadow-none hover:shadow-none"
          Success =>
            "bg-transparent border-transparent text-[var(--color-success)] hover:bg-[var(--color-success)]/10 hover:border-[var(--color-success)]/10 shadow-none hover:shadow-none"
          Warning =>
            "bg-transparent border-transparent text-[var(--color-warning)] hover:bg-[var(--color-warning)]/10 hover:border-[var(--color-warning)]/10 shadow-none hover:shadow-none"
          Error =>
            "bg-transparent border-transparent text-[var(--color-error)] hover:bg-[var(--color-error)]/10 hover:border-[var(--color-error)]/10 shadow-none hover:shadow-none"
        }
      Outlined =>
        match color {
          Primary =>
            "bg-transparent border-[var(--color-primary)] text-[var(--color-primary)] hover:bg-[var(--color-primary)] hover:text-[var(--color-primary-content)]"
          Secondary =>
            "bg-transparent border-[var(--color-secondary)] text-[var(--color-secondary)] hover:bg-[var(--color-secondary)] hover:text-[var(--color-secondary-content)]"
          Info =>
            "bg-transparent border-[var(--color-info)] text-[var(--color-info)] hover:bg-[var(--color-info)] hover:text-[var(--color-info-content)]"
          Success =>
            "bg-transparent border-[var(--color-success)] text-[var(--color-success)] hover:bg-[var(--color-success)] hover:text-[var(--color-success-content)]"
          Warning =>
            "bg-transparent border-[var(--color-warning)] text-[var(--color-warning)] hover:bg-[var(--color-warning)] hover:text-[var(--color-warning-content)]"
          Error =>
            "bg-transparent border-[var(--color-error)] text-[var(--color-error)] hover:bg-[var(--color-error)] hover:text-[var(--color-error-content)]"
        }
      Solid =>
        match color {
          Primary =>
            "bg-[var(--color-primary)] border-[var(--color-primary)] text-[var(--color-primary-content)] hover:bg-[var(--color-primary)]/80 hover:border-[var(--color-primary)]/80"
          Secondary =>
            "bg-[var(--color-secondary)] border-[var(--color-secondary)] text-[var(--color-secondary-content)] hover:bg-[var(--color-secondary)]/80 hover:border-[var(--color-secondary)]/80"
          Info =>
            "bg-[var(--color-info)] border-[var(--color-info)] text-[var(--color-info-content)] hover:bg-[var(--color-info)]/80 hover:border-[var(--color-info)]/80"
          Success =>
            "bg-[var(--color-success)] border-[var(--color-success)] text-[var(--color-success-content)] hover:bg-[var(--color-success)]/80 hover:border-[var(--color-success)]/80"
          Warning =>
            "bg-[var(--color-warning)] border-[var(--color-warning)] text-[var(--color-warning-content)] hover:bg-[var(--color-warning)]/80 hover:border-[var(--color-warning)]/80"
          Error =>
            "bg-[var(--color-error)] border-[var(--color-error)] text-[var(--color-error-content)] hover:bg-[var(--color-error)]/80 hover:border-[var(--color-error)]/80"
        }
      Gradient =>
        match color {
          Primary =>
            "bg-gradient-to-tr from-[var(--color-primary)] to-[var(--color-primary)]/80 border-[var(--color-primary)] text-[var(--color-primary-content)] hover:brightness-105"
          Secondary =>
            "bg-gradient-to-tr from-[var(--color-secondary)] to-[var(--color-secondary)]/80 border-[var(--color-secondary)] text-[var(--color-secondary-content)] hover:brightness-105"
          Info =>
            "bg-gradient-to-tr from-[var(--color-info)] to-[var(--color-info)]/80 border-[var(--color-info)] text-[var(--color-info-content)] hover:brightness-105"
          Success =>
            "bg-gradient-to-tr from-[var(--color-success)] to-[var(--color-success)]/80 border-[var(--color-success)] text-[var(--color-success-content)] hover:brightness-105"
          Warning =>
            "bg-gradient-to-tr from-[var(--color-warning)] to-[var(--color-warning)]/80 border-[var(--color-warning)] text-[var(--color-warning-content)] hover:brightness-105"
          Error =>
            "bg-gradient-to-tr from-[var(--color-error)] to-[var(--color-error)]/80 border-[var(--color-error)] text-[var(--color-error-content)] hover:brightness-105"
        }
    },
    // Full width style
    if fullWidth {
      "block w-full"
    } else {
      ""
    },
    // Ripple style
    if ripple {
      "ripple"
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
