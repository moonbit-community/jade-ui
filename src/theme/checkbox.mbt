///|
pub(all) enum CheckboxSize {
  Sm
  Md
  Lg
}

///|
pub(all) enum CheckboxColor {
  Primary
  Secondary
  Info
  Success
  Warning
  Error
}

///|
pub fn get_checkbox_container_style(
  size~ : CheckboxSize,
  color~ : CheckboxColor,
  disabled~ : Bool,
  class~ : String?
) -> String {
  clsx([
    "group shadow-sm shadow-black/5 inline-block relative cursor-pointer rounded bg-transparent border border-[var(--color-base-300)] transition-all duration-200 ease-in",
    // Size styles
    match size {
      Sm => "h-4 w-4"
      Md => "h-5 w-5"
      Lg => "h-6 w-6"
    },
    // Color styles
    match color {
      Primary =>
        "data-[checked=true]:bg-[var(--color-primary)] data-[checked=true]:border-[var(--color-primary)] text-[var(--color-primary-content)]"
      Secondary =>
        "data-[checked=true]:bg-[var(--color-secondary)] data-[checked=true]:border-[var(--color-secondary)] text-[var(--color-secondary-content)]"
      Info =>
        "data-[checked=true]:bg-[var(--color-info)] data-[checked=true]:border-[var(--color-info)] text-[var(--color-info-content)]"
      Success =>
        "data-[checked=true]:bg-[var(--color-success)] data-[checked=true]:border-[var(--color-success)] text-[var(--color-success-content)]"
      Warning =>
        "data-[checked=true]:bg-[var(--color-warning)] data-[checked=true]:border-[var(--color-warning)] text-[var(--color-warning-content)]"
      Error =>
        "data-[checked=true]:bg-[var(--color-error)] data-[checked=true]:border-[var(--color-error)] text-[var(--color-error-content)]"
    },
    // Disabled state
    if disabled {
      "opacity-50 pointer-events-none"
    } else {
      "hover:shadow-md"
    },
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_checkbox_input_style(
  size~ : CheckboxSize,
  disabled~ : Bool,
  class~ : String?
) -> String {
  clsx([
    "peer relative appearance-none cursor-pointer transition-all",
    // Size styles
    match size {
      Sm => "h-4 w-4"
      Md => "h-5 w-5"
      Lg => "h-6 w-6"
    },
    // Disabled state
    if disabled {
      "opacity-50 cursor-not-allowed"
    } else {
      "cursor-pointer"
    },
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_checkbox_label_style(
  size~ : CheckboxSize,
  disabled~ : Bool,
  class~ : String?
) -> String {
  clsx([
    "ml-2 select-none text-[var(--color-base-content)] font-light cursor-pointer mt-px",
    // Size styles
    match size {
      Sm => "text-sm"
      Md => "text-base"
      Lg => "text-lg"
    },
    // Disabled state
    if disabled {
      "opacity-50 cursor-not-allowed"
    } else {
      "cursor-pointer"
    },
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_checkbox_root_style(class~ : String?) -> String {
  clsx([
    "inline-flex items-center",
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_checkbox_indicator_style() -> String {
  "pointer-events-none absolute left-2/4 top-2/4 text-current -translate-x-2/4 -translate-y-2/4 scale-75 opacity-0 transition-all duration-200 ease-in data-[checked=true]:scale-100 data-[checked=true]:opacity-100"
}
