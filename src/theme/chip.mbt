///|
pub(all) enum ChipVariant {
  Ghost
  Solid
  Outline
  Gradient
}

///|
pub(all) enum ChipSize {
  Sm
  Md
  Lg
}

///|
pub(all) enum ChipColor {
  Primary
  Secondary
  Info
  Success
  Warning
  Error
}

///|
pub fn get_chip_style(
  variant~ : ChipVariant,
  size~ : ChipSize,
  color~ : ChipColor,
  isPill~ : Bool,
  class~ : String?,
) -> String {
  clsx([
    "relative inline-flex w-max items-center border font-sans font-medium",
    // Shape styles
    if isPill {
      "rounded-full"
    } else {
      "rounded-md"
    },
    // Size styles
    match size {
      Sm => "text-xs p-0.5 shadow-sm"
      Md => "text-sm p-0.5 shadow-sm"
      Lg => "text-sm p-1 shadow-sm"
    },
    // Variant and color combination styles
    match variant {
      Ghost =>
        match color {
          Primary =>
            "bg-[var(--color-primary)]/10 border-transparent text-[var(--color-primary)] shadow-none"
          Secondary =>
            "bg-[var(--color-secondary)]/10 border-transparent text-[var(--color-secondary)] shadow-none"
          Info =>
            "bg-[var(--color-info)]/10 border-transparent text-[var(--color-info)] shadow-none"
          Success =>
            "bg-[var(--color-success)]/10 border-transparent text-[var(--color-success)] shadow-none"
          Warning =>
            "bg-[var(--color-warning)]/10 border-transparent text-[var(--color-warning)] shadow-none"
          Error =>
            "bg-[var(--color-error)]/10 border-transparent text-[var(--color-error)] shadow-none"
        }
      Solid =>
        match color {
          Primary =>
            "bg-[var(--color-primary)] border-[var(--color-primary)] text-[var(--color-primary-content)]"
          Secondary =>
            "bg-[var(--color-secondary)] border-[var(--color-secondary)] text-[var(--color-secondary-content)]"
          Info =>
            "bg-[var(--color-info)] border-[var(--color-info)] text-[var(--color-info-content)]"
          Success =>
            "bg-[var(--color-success)] border-[var(--color-success)] text-[var(--color-success-content)]"
          Warning =>
            "bg-[var(--color-warning)] border-[var(--color-warning)] text-[var(--color-warning-content)]"
          Error =>
            "bg-[var(--color-error)] border-[var(--color-error)] text-[var(--color-error-content)]"
        }
      Outline =>
        match color {
          Primary =>
            "bg-transparent border-[var(--color-primary)] text-[var(--color-primary)]"
          Secondary =>
            "bg-transparent border-[var(--color-secondary)] text-[var(--color-secondary)]"
          Info =>
            "bg-transparent border-[var(--color-info)] text-[var(--color-info)]"
          Success =>
            "bg-transparent border-[var(--color-success)] text-[var(--color-success)]"
          Warning =>
            "bg-transparent border-[var(--color-warning)] text-[var(--color-warning)]"
          Error =>
            "bg-transparent border-[var(--color-error)] text-[var(--color-error)]"
        }
      Gradient =>
        match color {
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
pub fn get_chip_label_style(size~ : ChipSize, class~ : String?) -> String {
  clsx([
    "font-inherit text-inherit leading-none",
    // Size styles
    match size {
      Sm => "my-0.5 mx-1.5"
      Md => "my-1 mx-2.5"
      Lg => "my-1.5 mx-3"
    },
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_chip_icon_style(size~ : ChipSize, class~ : String?) -> String {
  clsx([
    "grid place-items-center shrink-0 rounded-full",
    // Size styles
    match size {
      Sm => "translate-x-0.5 w-3.5 h-3.5"
      Md => "translate-x-1 w-4 h-4"
      Lg => "translate-x-1.5 w-5 h-5"
    },
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_chip_dismiss_trigger_style(
  size~ : ChipSize,
  class~ : String?,
) -> String {
  clsx([
    "grid place-items-center shrink-0 rounded-full p-px cursor-pointer",
    // Size styles
    match size {
      Sm => "-translate-x-0.5 ms-0.5 w-4 h-4 stroke-2"
      Md => "-translate-x-1 ms-1 w-5 h-5 stroke-2"
      Lg => "-translate-x-1.5 ms-1.5 w-6 h-6 stroke-2"
    },
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}
