///|
pub(all) enum CardVariant {
  Ghost
  Solid
  Outline
  Gradient
}

///|
pub(all) enum CardColor {
  Default
  Primary
  Secondary
  Success
  Info
  Warning
  Error
}

///|
pub fn get_card_style(
  variant~ : CardVariant,
  color~ : CardColor,
  class? : String,
) -> String {
  clsx([
    // Base styles
    "w-full rounded-lg border shadow-sm overflow-hidden",
    // Variant and color combination styles
    match variant {
      Ghost =>
        match color {
          Default =>
            "bg-[var(--color-base-100)]/10 border-transparent shadow-transparent"
          Primary =>
            "bg-[var(--color-primary)]/10 border-transparent shadow-transparent"
          Secondary =>
            "bg-[var(--color-secondary)]/10 border-transparent shadow-transparent"
          Info =>
            "bg-[var(--color-info)]/10 border-transparent shadow-transparent"
          Success =>
            "bg-[var(--color-success)]/10 border-transparent shadow-transparent"
          Warning =>
            "bg-[var(--color-warning)]/10 border-transparent shadow-transparent"
          Error =>
            "bg-[var(--color-error)]/10 border-transparent shadow-transparent"
        }
      Solid =>
        match color {
          Default =>
            "bg-[var(--color-base-100)] border-[var(--color-base-200)] shadow-black/5"
          Primary =>
            "bg-[var(--color-primary)] border-[var(--color-primary-dark)] shadow-[var(--color-primary-dark)]/25"
          Secondary =>
            "bg-[var(--color-secondary)] border-[var(--color-secondary-dark)] shadow-[var(--color-secondary-dark)]/25"
          Info =>
            "bg-[var(--color-info)] border-[var(--color-info-dark)] shadow-[var(--color-info-dark)]/25"
          Success =>
            "bg-[var(--color-success)] border-[var(--color-success-dark)] shadow-[var(--color-success-dark)]/25"
          Warning =>
            "bg-[var(--color-warning)] border-[var(--color-warning-dark)] shadow-[var(--color-warning-dark)]/25"
          Error =>
            "bg-[var(--color-error)] border-[var(--color-error-dark)] shadow-[var(--color-error-dark)]/25"
        }
      Outline =>
        match color {
          Default =>
            "bg-transparent border-[var(--color-base-200)] shadow-black/5"
          Primary =>
            "bg-transparent border-[var(--color-primary)] shadow-black/5"
          Secondary =>
            "bg-transparent border-[var(--color-secondary)] shadow-black/5"
          Info => "bg-transparent border-[var(--color-info)] shadow-black/5"
          Success =>
            "bg-transparent border-[var(--color-success)] shadow-black/5"
          Warning =>
            "bg-transparent border-[var(--color-warning)] shadow-black/5"
          Error => "bg-transparent border-[var(--color-error)] shadow-black/5"
        }
      Gradient =>
        match color {
          Default =>
            "bg-gradient-to-tr from-[var(--color-base-100)] to-[var(--color-base-100)]/80 border-[var(--color-base-200)] text-[var(--color-base-content)]"
          Primary =>
            "bg-gradient-to-tr from-[var(--color-primary)] to-[var(--color-primary)]/80 border-[var(--color-primary)] text-[var(--color-primary-content)]"
          Secondary =>
            "bg-gradient-to-tr from-[var(--color-secondary)] to-[var(--color-secondary)]/80 border-[var(--color-secondary)] text-[var(--color-secondary-content)]"
          Info =>
            "bg-gradient-to-tr from-[var(--color-info)] to-[var(--color-info)]/80 border-[var(--color-info)] text-[var(--color-info-content)]"
          Success =>
            "bg-gradient-to-tr from-[var(--color-success)] to-[var(--color-success)]/80 border-[var(--color-success)] text-[var(--color-success-content)]"
          Warning =>
            "bg-gradient-to-tr from-[var(--color-warning)] to-[var(--color-warning)]/80 border-[var(--color-warning)] text-[var(--color-warning-content)]"
          Error =>
            "bg-gradient-to-tr from-[var(--color-error)] to-[var(--color-error)]/80 border-[var(--color-error)] text-[var(--color-error-content)]"
        }
    },
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_card_header_style(class~ : String?) -> String {
  clsx([
    "w-[calc(100%-16px)] h-max rounded m-2",
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_card_body_style(class~ : String?) -> String {
  clsx([
    "w-full h-max rounded px-3.5 py-2.5",
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_card_footer_style(class~ : String?) -> String {
  clsx([
    "w-full px-3.5 pt-2 pb-3.5 rounded",
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}
