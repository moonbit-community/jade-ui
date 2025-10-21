///|
pub(all) enum RadioSize {
  Sm
  Md
  Lg
}

///|
pub(all) enum RadioColor {
  Primary
  Secondary
  Info
  Success
  Warning
  Error
}

///|
pub fn get_radio_container_style(disabled~ : Bool, class~ : String?) -> String {
  clsx([
    "inline-flex items-center cursor-pointer select-none",
    // Disabled state
    if disabled {
      "opacity-50 cursor-not-allowed"
    } else {
      ""
    },
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_radio_visual_style(
  size~ : RadioSize,
  color~ : RadioColor,
  disabled~ : Bool,
) -> String {
  clsx([
    "flex items-center justify-center rounded-full peer-checked:border-4 border-2 bg-[var(--color-base-100)] transition-all shadow-sm",
    // Size styles
    match size {
      Sm => "w-4 h-4"
      Md => "w-5 h-5"
      Lg => "w-6 h-6"
    },
    // Base border and focus styles
    "border-[var(--color-base-300)] peer-focus:ring-2 peer-focus:ring-opacity-50",
    // Color styles for checked state
    match color {
      Primary =>
        "peer-checked:border-[var(--color-primary)] peer-focus:ring-[var(--color-primary)]/20"
      Secondary =>
        "peer-checked:border-[var(--color-secondary)] peer-focus:ring-[var(--color-secondary)]/20"
      Info =>
        "peer-checked:border-[var(--color-info)] peer-focus:ring-[var(--color-info)]/20"
      Success =>
        "peer-checked:border-[var(--color-success)] peer-focus:ring-[var(--color-success)]/20"
      Warning =>
        "peer-checked:border-[var(--color-warning)] peer-focus:ring-[var(--color-warning)]/20"
      Error =>
        "peer-checked:border-[var(--color-error)] peer-focus:ring-[var(--color-error)]/20"
    },
    // Disabled state
    if disabled {
      "opacity-50"
    } else {
      ""
    },
  ])
}

///|
pub fn get_radio_dot_style(size~ : RadioSize) -> String {
  clsx([
    "rounded-full bg-[var(--color-base-100)] scale-0 transition-transform peer-checked:scale-100",
    // Size styles for the inner dot
    match size {
      Sm => "w-1.5 h-1.5"
      Md => "w-2 h-2"
      Lg => "w-2.5 h-2.5"
    },
  ])
}

///|
pub fn get_radio_label_style(size~ : RadioSize, disabled~ : Bool) -> String {
  clsx([
    "text-sm font-medium select-none",
    // Size styles
    match size {
      Sm => "text-sm"
      Md => "text-base"
      Lg => "text-lg"
    },
    // Disabled state
    if disabled {
      "text-[var(--color-base-content)]/40 cursor-not-allowed"
    } else {
      "text-[var(--color-base-content)] cursor-pointer"
    },
  ])
}
