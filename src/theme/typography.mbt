///|
pub(all) enum TypographyType {
  H1
  H2
  H3
  H4
  H5
  H6
  Lead
  P
  Small
}

///|
pub(all) enum TypographyColor {
  Inherit
  Default
  Primary
  Secondary
  Success
  Info
  Warning
  Error
}

///|
pub fn get_typography_style(
  typography_type : TypographyType,
  color : TypographyColor,
  class : String
) -> String {
  let base_style = "font-sans antialiased"
  let type_style = match typography_type {
    H1 => "font-bold text-4xl md:text-5xl lg:text-6xl"
    H2 => "font-bold text-3xl md:text-4xl lg:text-5xl"
    H3 => "font-bold text-2xl md:text-3xl lg:text-4xl"
    H4 => "font-bold text-xl md:text-2xl lg:text-3xl"
    H5 => "font-bold text-lg md:text-xl lg:text-2xl"
    H6 => "font-bold text-base md:text-lg lg:text-xl"
    Lead => "text-base md:text-lg"
    P => "text-base"
    Small => "text-sm"
  }
  let color_style = match color {
    Inherit => "text-inherit"
    Default => "text-black dark:text-white"
    Primary => "text-[var(--color-primary)]"
    Secondary => "text-[var(--color-secondary)]"
    Info => "text-[var(--color-info)]"
    Success => "text-[var(--color-success)]"
    Warning => "text-[var(--color-warning)]"
    Error => "text-[var(--color-error)]"
  }
  // Optimize string concatenation performance, avoid creating temporary arrays
  let result = base_style + " " + type_style + " " + color_style
  if class.is_empty() {
    result
  } else {
    result + " " + class
  }
}
