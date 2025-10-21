// Spinner component theme configuration

// Spinner size variants

///|
pub(all) enum SpinnerSize {
  Xs
  Sm
  Md
  Lg
  Xl
  Xxl
}

// Spinner color variants (reusing existing color system from JadeTheme)

///|
pub(all) enum SpinnerColor {
  Primary
  Secondary
  Success
  Warning
  Error
  Info
}

// Generate CSS classes for spinner styling

///|
pub fn get_spinner_style(
  size~ : SpinnerSize,
  color~ : SpinnerColor,
  class? : String = "",
) -> String {
  let size_classes = match size {
    Xs => "w-4 h-4"
    Sm => "w-6 h-6"
    Md => "w-8 h-8"
    Lg => "w-10 h-10"
    Xl => "w-12 h-12"
    Xxl => "w-16 h-16"
  }
  let color_classes = match color {
    Primary => "text-[var(--color-primary)]"
    Secondary => "text-[var(--color-secondary)]"
    Success => "text-[var(--color-success)]"
    Warning => "text-[var(--color-warning)]"
    Error => "text-[var(--color-error)]"
    Info => "text-[var(--color-info)]"
  }
  let base_classes = "animate-spin"
  clsx([base_classes, size_classes, color_classes, class])
}

// Generate CSS classes for spinner stroke color

///|
pub fn get_spinner_stroke_style(color~ : SpinnerColor) -> String {
  match color {
    Primary => "stroke-[var(--color-primary)]/20"
    Secondary => "stroke-[var(--color-secondary)]/20"
    Success => "stroke-[var(--color-success)]/20"
    Warning => "stroke-[var(--color-warning)]/20"
    Error => "stroke-[var(--color-error)]/20"
    Info => "stroke-[var(--color-info)]/20"
  }
}
