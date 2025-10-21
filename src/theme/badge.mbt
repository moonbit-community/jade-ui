///|
pub(all) enum BadgeVariant {
  Ghost
  Solid
  Outline
  Gradient
}

///|
pub(all) enum BadgeSize {
  Sm
  Md
  Lg
}

///|
pub(all) enum BadgeColor {
  Primary
  Secondary
  Info
  Success
  Warning
  Error
}

///|
pub(all) enum BadgeOverlap {
  Circular
  Square
}

///|
pub(all) enum BadgePlacement {
  TopStart
  TopEnd
  BottomStart
  BottomEnd
}

///|
pub fn get_badge_container_style(className~ : String?) -> String {
  clsx([
    "relative inline-flex",
    match className {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_badge_indicator_style(
  variant~ : BadgeVariant,
  size~ : BadgeSize,
  color~ : BadgeColor,
  overlap~ : BadgeOverlap,
  placement~ : BadgePlacement,
  className~ : String?,
) -> String {
  clsx([
    "absolute px-1 py-0.5 text-xs border leading-none grid place-items-center rounded-full min-w-3 min-h-3",
    // Size styles
    match size {
      Sm => "min-w-2 min-h-2 text-xs px-0.5 py-0"
      Md => "min-w-3 min-h-3 text-xs px-1 py-0.5"
      Lg => "min-w-4 min-h-4 text-sm px-1.5 py-1"
    },
    // Placement styles
    match (placement, overlap) {
      (TopStart, Square) =>
        "top-[6%] left-[6%] -translate-x-1/2 -translate-y-1/2"
      (TopStart, Circular) =>
        "top-[14%] left-[14%] -translate-x-1/2 -translate-y-1/2"
      (TopEnd, Square) => "top-[6%] right-[6%] translate-x-1/2 -translate-y-1/2"
      (TopEnd, Circular) =>
        "top-[14%] right-[14%] translate-x-1/2 -translate-y-1/2"
      (BottomStart, Square) =>
        "bottom-[6%] left-[6%] -translate-x-1/2 translate-y-1/2"
      (BottomStart, Circular) =>
        "bottom-[14%] left-[14%] -translate-x-1/2 translate-y-1/2"
      (BottomEnd, Square) =>
        "bottom-[6%] right-[6%] translate-x-1/2 translate-y-1/2"
      (BottomEnd, Circular) =>
        "bottom-[14%] right-[14%] translate-x-1/2 translate-y-1/2"
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
    match className {
      Some(cls) => cls
      None => ""
    },
  ])
}
