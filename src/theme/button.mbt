///|
pub(all) enum ButtonVariant {
  Ghost
  Outlined
  Solid
  Gradient
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
    "inline-flex items-center justify-center border align-middle select-none font-sans font-medium text-center transition-all duration-300 ease-in disabled:opacity-50 disabled:shadow-none disabled:cursor-not-allowed data-[shape=pill]:rounded-full data-[width=full]:w-full focus:shadow-none text-sm rounded-md py-2 px-4 shadow-sm hover:shadow-md",
    match variant {
      Ghost =>
        "bg-transparent border-transparent text-[var(--color-primary)] hover:bg-[var(--color-primary)]/5 hover:border-[var(--color-primary)]/5 shadow-none hover:shadow-none active:bg-[var(--color-primary)]/20"
      Outlined =>
        "bg-transparent border-[var(--color-primary)] text-[var(--color-primary)] hover:bg-[var(--color-primary)] hover:text-[var(--color-primary-content)]"
      Solid =>
        "bg-[var(--color-primary)] border-[var(--color-primary)] text-[var(--color-primary-content)] hover:bg-[var(--color-primary)]/80 hover:border-[var(--color-primary)]/80"
      Gradient =>
        "bg-gradient-to-tr from-[var(--color-primary)] to-[var(--color-primary)]/10 text-[var(--color-primary-content)] shadow-md shadow-[var(--color-base-200)]/10 hover:shadow-lg hover:shadow-[var(--color-base-200)]/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none"
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
