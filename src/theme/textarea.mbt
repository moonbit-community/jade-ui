///|
pub(all) enum TextareaSize {
  Sm
  Md
  Lg
}

///|
pub(all) enum TextareaColor {
  Primary
  Secondary
  Info
  Success
  Warning
  Error
}

///|
pub fn get_textarea_style(
  size~ : TextareaSize,
  color~ : TextareaColor,
  resize~ : Bool,
  isError~ : Bool,
  isSuccess~ : Bool,
  className~ : String?,
) -> String {
  clsx([
    // Base styles
    "peer block w-full resize-none outline-none focus:outline-none text-black dark:text-white placeholder:text-foreground/60 bg-transparent ring-transparent border border-surface transition-all duration-300 ease-in disabled:opacity-50 disabled:pointer-events-none",
    // Size styles
    match size {
      Sm => "text-sm shadow-sm p-2 rounded-md ring"
      Md => "text-sm shadow-sm p-2.5 rounded-md ring"
      Lg => "text-base shadow-sm p-3 rounded-lg ring-4"
    },
    // Color styles
    match color {
      Primary =>
        "hover:border-[var(--color-primary)] hover:ring-[var(--color-primary)]/10 focus:border-[var(--color-primary)] focus:ring-[var(--color-primary)]/10"
      Secondary =>
        "hover:border-[var(--color-secondary)] hover:ring-[var(--color-secondary)]/10 focus:border-[var(--color-secondary)] focus:ring-[var(--color-secondary)]/10"
      Info =>
        "hover:border-[var(--color-info)] hover:ring-[var(--color-info)]/10 focus:border-[var(--color-info)] focus:ring-[var(--color-info)]/10"
      Success =>
        "hover:border-[var(--color-success)] hover:ring-[var(--color-success)]/10 focus:border-[var(--color-success)] focus:ring-[var(--color-success)]/10"
      Warning =>
        "hover:border-[var(--color-warning)] hover:ring-[var(--color-warning)]/10 focus:border-[var(--color-warning)] focus:ring-[var(--color-warning)]/10"
      Error =>
        "hover:border-[var(--color-error)] hover:ring-[var(--color-error)]/10 focus:border-[var(--color-error)] focus:ring-[var(--color-error)]/10"
    },
    // Resize style
    if resize {
      "resize-y"
    } else {
      ""
    },
    // Error state
    if isError {
      "border-[var(--color-error)]"
    } else {
      ""
    },
    // Success state
    if isSuccess {
      "border-[var(--color-success)]"
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