///|
pub(all) enum AlertVariant {
  Solid
  Outlined
  Ghost
  Gradient
}

///|
pub(all) enum AlertColor {
  Primary
  Secondary
  Info
  Success
  Warning
  Error
}

///|
pub fn get_alert_style(
  variant~ : AlertVariant,
  color~ : AlertColor,
  dismissible~ : Bool,
  class~ : String?,
) -> String {
  clsx([
    "relative w-full rounded-lg px-4 py-3 text-sm font-medium",
    "flex items-start gap-3",
    // Variant and color combination styles
    match variant {
      Solid =>
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
      Outlined =>
        match color {
          Primary =>
            "border border-[var(--color-primary)] bg-[var(--color-primary)]/5 text-[var(--color-primary)]"
          Secondary =>
            "border border-[var(--color-secondary)] bg-[var(--color-secondary)]/5 text-[var(--color-secondary)]"
          Info =>
            "border border-[var(--color-info)] bg-[var(--color-info)]/5 text-[var(--color-info)]"
          Success =>
            "border border-[var(--color-success)] bg-[var(--color-success)]/5 text-[var(--color-success)]"
          Warning =>
            "border border-[var(--color-warning)] bg-[var(--color-warning)]/5 text-[var(--color-warning)]"
          Error =>
            "border border-[var(--color-error)] bg-[var(--color-error)]/5 text-[var(--color-error)]"
        }
      Ghost =>
        match color {
          Primary => "bg-[var(--color-primary)]/10 text-[var(--color-primary)]"
          Secondary =>
            "bg-[var(--color-secondary)]/10 text-[var(--color-secondary)]"
          Info => "bg-[var(--color-info)]/10 text-[var(--color-info)]"
          Success => "bg-[var(--color-success)]/10 text-[var(--color-success)]"
          Warning => "bg-[var(--color-warning)]/10 text-[var(--color-warning)]"
          Error => "bg-[var(--color-error)]/10 text-[var(--color-error)]"
        }
      Gradient =>
        match color {
          Primary =>
            "bg-gradient-to-r from-[var(--color-primary)] to-[var(--color-primary)]/80 text-[var(--color-primary-content)]"
          Secondary =>
            "bg-gradient-to-r from-[var(--color-secondary)] to-[var(--color-secondary)]/80 text-[var(--color-secondary-content)]"
          Info =>
            "bg-gradient-to-r from-[var(--color-info)] to-[var(--color-info)]/80 text-[var(--color-info-content)]"
          Success =>
            "bg-gradient-to-r from-[var(--color-success)] to-[var(--color-success)]/80 text-[var(--color-success-content)]"
          Warning =>
            "bg-gradient-to-r from-[var(--color-warning)] to-[var(--color-warning)]/80 text-[var(--color-warning-content)]"
          Error =>
            "bg-gradient-to-r from-[var(--color-error)] to-[var(--color-error)]/80 text-[var(--color-error-content)]"
        }
    },
    // Dismissible padding adjustment
    if dismissible {
      "pr-10"
    } else {
      ""
    },
    class.unwrap_or(""),
  ])
}

///|
pub fn get_alert_icon_style() -> String {
  "flex-shrink-0 w-5 h-5 mt-0.5"
}

///|
pub fn get_alert_content_style() -> String {
  "flex-1"
}

///|
pub fn get_alert_dismiss_style() -> String {
  "absolute top-3 right-3 p-1 rounded-md hover:bg-black/10 transition-colors"
}
