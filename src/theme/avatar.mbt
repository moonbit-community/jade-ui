///|
pub(all) enum AvatarSize {
  Xs
  Sm
  Md
  Lg
  Xl
}

///|
pub(all) enum AvatarShape {
  Circle
  Square
}

///|
pub(all) enum AvatarColor {
  Primary
  Secondary
  Info
  Success
  Warning
  Error
  Neutral
}

///|
pub fn get_avatar_style(
  size~ : AvatarSize,
  shape~ : AvatarShape,
  color~ : AvatarColor,
  class? : String,
) -> String {
  clsx([
    "inline-flex items-center justify-center overflow-hidden bg-gray-100 font-medium text-gray-600 select-none",
    // Size styles
    match size {
      Xs => "w-6 h-6 text-xs"
      Sm => "w-8 h-8 text-sm"
      Md => "w-10 h-10 text-base"
      Lg => "w-12 h-12 text-lg"
      Xl => "w-16 h-16 text-xl"
    },
    // Shape styles
    match shape {
      Circle => "rounded-full"
      Square => "rounded-md"
    },
    // Color styles
    match color {
      Primary => "bg-[var(--color-primary)] text-[var(--color-primary-content)]"
      Secondary =>
        "bg-[var(--color-secondary)] text-[var(--color-secondary-content)]"
      Info => "bg-[var(--color-info)] text-[var(--color-info-content)]"
      Success => "bg-[var(--color-success)] text-[var(--color-success-content)]"
      Warning => "bg-[var(--color-warning)] text-[var(--color-warning-content)]"
      Error => "bg-[var(--color-error)] text-[var(--color-error-content)]"
      Neutral => "bg-[var(--color-neutral)] text-[var(--color-neutral-content)]"
    },
    class.unwrap_or(""),
  ])
}

///|
pub fn get_avatar_image_style(shape~ : AvatarShape) -> String {
  clsx([
    "w-full h-full object-cover",
    match shape {
      Circle => "rounded-full"
      Square => "rounded-md"
    },
  ])
}
