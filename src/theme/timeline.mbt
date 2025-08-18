///|
pub(all) enum TimelineOrientation {
  Horizontal
  Vertical
}

///|
pub(all) enum TimelineMode {
  Timeline
  Stepper
}

///|
pub(all) enum TimelineColor {
  Primary
  Secondary
  Info
  Success
  Warning
  Error
}

///|
pub fn get_timeline_style(
  orientation~ : TimelineOrientation,
  className~ : String?,
) -> String {
  clsx([
    "flex",
    match orientation {
      Horizontal => "flex-row items-center space-x-4"
      Vertical => "flex-col space-y-4"
    },
    match className {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_timeline_item_style(
  orientation~ : TimelineOrientation,
  isActive~ : Bool,
  isCompleted~ : Bool,
  class~ : String?,
) -> String {
  clsx([
    "relative flex items-center",
    match orientation {
      Horizontal => "flex-col text-center"
      Vertical => "flex-row space-x-3 relative"
    },
    if isActive {
      "opacity-100"
    } else {
      "opacity-70"
    },
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_timeline_header_style(
  orientation~ : TimelineOrientation,
  class~ : String?,
) -> String {
  clsx([
    "flex items-center justify-center",
    match orientation {
      Horizontal => "mb-2"
      Vertical => "flex-shrink-0"
    },
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_timeline_icon_style(
  color~ : TimelineColor,
  isActive~ : Bool,
  isCompleted~ : Bool,
  className~ : String?,
) -> String {
  clsx([
    "w-8 h-8 rounded-full flex items-center justify-center text-sm font-medium transition-all duration-200",
    if isCompleted {
      match color {
        Primary =>
          "bg-[var(--color-primary)] text-[var(--color-primary-content)]"
        Secondary =>
          "bg-[var(--color-secondary)] text-[var(--color-secondary-content)]"
        Info => "bg-[var(--color-info)] text-[var(--color-info-content)]"
        Success =>
          "bg-[var(--color-success)] text-[var(--color-success-content)]"
        Warning =>
          "bg-[var(--color-warning)] text-[var(--color-warning-content)]"
        Error => "bg-[var(--color-error)] text-[var(--color-error-content)]"
      }
    } else if isActive {
      match color {
        Primary =>
          "bg-[var(--color-primary)]/20 border-2 border-[var(--color-primary)] text-[var(--color-primary)]"
        Secondary =>
          "bg-[var(--color-secondary)]/20 border-2 border-[var(--color-secondary)] text-[var(--color-secondary)]"
        Info =>
          "bg-[var(--color-info)]/20 border-2 border-[var(--color-info)] text-[var(--color-info)]"
        Success =>
          "bg-[var(--color-success)]/20 border-2 border-[var(--color-success)] text-[var(--color-success)]"
        Warning =>
          "bg-[var(--color-warning)]/20 border-2 border-[var(--color-warning)] text-[var(--color-warning)]"
        Error =>
          "bg-[var(--color-error)]/20 border-2 border-[var(--color-error)] text-[var(--color-error)]"
      }
    } else {
      "bg-gray-200 border-2 border-gray-300 text-gray-500"
    },
    match className {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_timeline_separator_style(
  orientation~ : TimelineOrientation,
  color~ : TimelineColor,
  isCompleted~ : Bool,
  class~ : String?,
) -> String {
  clsx([
    "transition-all duration-200",
    match orientation {
      Horizontal => "hidden"
      Vertical => "w-0.5 h-full absolute left-4 top-8 -translate-x-1/2"
    },
    if isCompleted {
      match color {
        Primary => "bg-[var(--color-primary)]"
        Secondary => "bg-[var(--color-secondary)]"
        Info => "bg-[var(--color-info)]"
        Success => "bg-[var(--color-success)]"
        Warning => "bg-[var(--color-warning)]"
        Error => "bg-[var(--color-error)]"
      }
    } else {
      "bg-gray-300"
    },
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_timeline_body_style(
  orientation~ : TimelineOrientation,
  className~ : String?,
) -> String {
  clsx([
    "text-sm",
    match orientation {
      Horizontal => "text-center mt-2"
      Vertical => "flex-1"
    },
    match className {
      Some(cls) => cls
      None => ""
    },
  ])
}
