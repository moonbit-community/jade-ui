///|
pub(all) enum ButtonVariant {
  Solid
  Gradient
  Outlined
  Text
}

///|
pub(all) enum ButtonSize {
  Sm
  Md
  Lg
}

///|
pub fn get_button_style(
  variant~ : ButtonVariant,
  size~ : ButtonSize,
  fullWidth~ : Bool,
  ripple~ : Bool,
  className~ : String?
) -> String {
  [
    "align-middle select-none font-sans font-bold text-center uppercase transition-all disabled:opacity-50 disabled:shadow-none disabled:pointer-events-none",
    match variant {
      Solid =>
        "bg-[var(--color-primary)] text-[var(--color-primary-content)] shadow-md shadow-[var(--color-base-200)]/10 hover:shadow-lg hover:shadow-[var(--color-base-200)]/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none"
      Gradient =>
        "bg-gradient-to-tr from-[var(--color-primary)] to-[var(--color-primary)]/10 text-[var(--color-primary-content)] shadow-md shadow-[var(--color-base-200)]/10 hover:shadow-lg hover:shadow-[var(--color-base-200)]/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none"
      Outlined =>
        "border border-[var(--color-primary)] text-[var(--color-base-content)] hover:opacity-75 focus:ring focus:ring-[var(--color-primary)] active:opacity-[0.85]"
      Text =>
        "text-[var(--color-primary)] hover:bg-[var(--color-primary)]/10 active:bg-[var(--color-primary)]/20"
    },
    match size {
      Sm => "text-xs py-2 px-4 rounded-[var(--radius-field)]"
      Md => "text-xs py-3 px-6 rounded-[var(--radius-field)]"
      Lg => "text-sm py-3.5 px-7 rounded-[var(--radius-field)]"
    },
    if fullWidth {
      "block w-full"
    } else {
      ""
    },
    if ripple {
      "ripple"
    } else {
      ""
    },
    match className {
      Some(cls) => cls
      None => ""
    },
  ].join(" ")
}
