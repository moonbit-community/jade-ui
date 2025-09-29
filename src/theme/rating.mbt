///|
pub(all) enum RatingColor {
  Primary
  Secondary
  Info
  Success
  Warning
  Error
}

///|
pub(all) enum RatingSize {
  Sm
  Md
  Lg
  Xl
}

///|
pub fn get_rating_style(class~ : String?) -> String {
  clsx([
    "inline-flex items-center gap-1",
    match class {
      Some(c) => c
      None => ""
    },
  ])
}

///|
pub fn get_rating_icon_style(
  is_filled : Bool,
  color~ : RatingColor,
  size~ : RatingSize,
) -> String {
  clsx([
    "transition-colors duration-200",
    // Size styles
    match size {
      Sm => "h-4 w-4"
      Md => "h-6 w-6"
      Lg => "h-8 w-8"
      Xl => "h-10 w-10"
    },
    // Color styles based on filled state
    if is_filled {
      match color {
        Primary => "text-[var(--color-primary)]"
        Secondary => "text-[var(--color-secondary)]"
        Info => "text-[var(--color-info)]"
        Success => "text-[var(--color-success)]"
        Warning => "text-[var(--color-warning)]"
        Error => "text-[var(--color-error)]"
      }
    } else {
      "text-gray-300 hover:text-gray-400"
    },
  ])
}
