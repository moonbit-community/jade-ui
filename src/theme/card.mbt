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
  class~ : String?
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
            "bg-[var(--color-base-100)] border-[var(--color-base-200)] shadow-black/5"
          Primary =>
            "bg-gradient-to-t from-[var(--color-primary-dark)] to-[var(--color-primary-light)] shadow-[var(--color-primary)]/25 border-[var(--color-primary)]"
          Secondary =>
            "bg-gradient-to-t from-[var(--color-secondary-dark)] to-[var(--color-secondary-light)] shadow-[var(--color-secondary)]/25 border-[var(--color-secondary)]"
          Info =>
            "bg-gradient-to-t from-[var(--color-info-dark)] to-[var(--color-info-light)] shadow-[var(--color-info)]/25 border-[var(--color-info)]"
          Success =>
            "bg-gradient-to-t from-[var(--color-success-dark)] to-[var(--color-success-light)] shadow-[var(--color-success)]/25 border-[var(--color-success)]"
          Warning =>
            "bg-gradient-to-t from-[var(--color-warning-dark)] to-[var(--color-warning-light)] shadow-[var(--color-warning)]/25 border-[var(--color-warning)]"
          Error =>
            "bg-gradient-to-t from-[var(--color-error-dark)] to-[var(--color-error-light)] shadow-[var(--color-error)]/25 border-[var(--color-error)]"
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
