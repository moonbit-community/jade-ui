///|
pub(all) enum ProgressVariant {
  Filled
  Gradient
}

///|
pub(all) enum ProgressColor {
  Primary
  Secondary
  Success
  Info
  Warning
  Error
}

///|
pub(all) enum ProgressSize {
  Sm
  Md
  Lg
}

///|
pub fn get_progress_container_style(
  size~ : ProgressSize,
  className~ : String?
) -> String {
  [
    "w-full overflow-hidden rounded-full bg-[var(--color-base-200)]",
    match size {
      Sm => "h-1"
      Md => "h-2"
      Lg => "h-3"
    },
    if className is Some(className) {
      className
    } else {
      ""
    },
  ].join(" ")
}

///|
pub fn get_progress_bar_style(
  variant~ : ProgressVariant,
  color~ : ProgressColor,
  size~ : ProgressSize,
  className~ : String?
) -> String {
  let base_style = "h-full transition-all duration-300 ease-in-out"
  let variant_color_style = match variant {
    Filled =>
      match color {
        Primary => "bg-[var(--color-primary)]"
        Secondary => "bg-[var(--color-secondary)]"
        Success => "bg-[var(--color-success)]"
        Info => "bg-[var(--color-info)]"
        Warning => "bg-[var(--color-warning)]"
        Error => "bg-[var(--color-error)]"
      }
    Gradient =>
      match color {
        Primary =>
          "bg-gradient-to-r from-[var(--color-primary)] to-[var(--color-primary)]/80"
        Secondary =>
          "bg-gradient-to-r from-[var(--color-secondary)] to-[var(--color-secondary)]/80"
        Success =>
          "bg-gradient-to-r from-[var(--color-success)] to-[var(--color-success)]/80"
        Info =>
          "bg-gradient-to-r from-[var(--color-info)] to-[var(--color-info)]/80"
        Warning =>
          "bg-gradient-to-r from-[var(--color-warning)] to-[var(--color-warning)]/80"
        Error =>
          "bg-gradient-to-r from-[var(--color-error)] to-[var(--color-error)]/80"
      }
  }
  let size_style = match size {
    Sm => "text-xs"
    Md => "text-sm"
    Lg => "text-base"
  }
  [
    base_style,
    variant_color_style,
    size_style,
    if className is Some(className) {
      className
    } else {
      ""
    },
  ].join(" ")
}

///|
pub fn get_progress_label_style(
  size~ : ProgressSize,
  className~ : String?
) -> String {
  [
    "text-[var(--color-base-content)] font-medium",
    match size {
      Sm => "text-xs"
      Md => "text-sm"
      Lg => "text-base"
    },
    if className is Some(className) {
      className
    } else {
      ""
    },
  ].join(" ")
}

///|
pub fn progress_root_style(className~ : String?) -> String {
  ["w-full", if className is Some(className) { className } else { "" }].join(
    " ",
  )
}
