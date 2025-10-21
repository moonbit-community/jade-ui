///|
pub(all) enum SwitchColor {
  Primary
  Secondary
  Info
  Success
  Warning
  Error
}

///|
pub fn get_switch_color_classes(color : SwitchColor) -> String {
  match color {
    Primary =>
      "checked:before:bg-[var(--color-primary)] checked:after:border-[var(--color-primary)]"
    Secondary =>
      "checked:before:bg-[var(--color-secondary)] checked:after:border-[var(--color-secondary)]"
    Info =>
      "checked:before:bg-[var(--color-info)] checked:after:border-[var(--color-info)]"
    Success =>
      "checked:before:bg-[var(--color-success)] checked:after:border-[var(--color-success)]"
    Warning =>
      "checked:before:bg-[var(--color-warning)] checked:after:border-[var(--color-warning)]"
    Error =>
      "checked:before:bg-[var(--color-error)] checked:after:border-[var(--color-error)]"
  }
}

///|
pub fn get_switch_style(color~ : SwitchColor, class? : String) -> String {
  clsx([
    "appearance-none relative inline-block rounded-full w-12 h-6 cursor-pointer",
    "before:inline-block before:absolute before:top-0 before:left-0 before:w-full before:h-full",
    "before:rounded-full before:bg-[var(--color-base-300)] before:transition-colors before:duration-200 before:ease-in",
    "after:absolute after:top-2/4 after:left-0 after:-translate-y-2/4 after:w-6 after:h-6",
    "after:border after:border-[var(--color-base-300)] after:bg-[var(--color-base-100)] after:rounded-full",
    "checked:after:translate-x-full after:transition-all after:duration-200 after:ease-in",
    "disabled:opacity-50 disabled:cursor-not-allowed",
    "focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-[var(--color-primary)]/20",
    get_switch_color_classes(color),
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}
