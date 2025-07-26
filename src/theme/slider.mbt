///|
pub(all) enum SliderSize {
  Xs
  Sm
  Md
  Lg
  Xl
}

///|
pub(all) enum SliderColor {
  Primary
  Secondary
  Info
  Success
  Warning
  Error
}

///|
pub fn get_slider_thumb_height(size : SliderSize) -> Int {
  match size {
    Xs => 2
    Sm => 3
    Md => 4
    Lg => 5
    Xl => 6
  }
}

///|
pub fn get_slider_color_value(color : SliderColor) -> String {
  match color {
    Primary => "var(--color-primary)"
    Secondary => "var(--color-secondary)"
    Info => "var(--color-info)"
    Success => "var(--color-success)"
    Warning => "var(--color-warning)"
    Error => "var(--color-error)"
  }
}

///|
pub fn get_slider_classes(class : String) -> String {
  [
    "w-full appearance-none bg-gray-300 rounded-full outline-none focus:outline-none",
    "[&::-webkit-slider-thumb]:appearance-none [&::-webkit-slider-thumb]:rounded-full [&::-webkit-slider-thumb]:bg-current [&::-webkit-slider-thumb]:border-0 [&::-webkit-slider-thumb]:cursor-pointer",
    "[&::-webkit-slider-thumb]:h-[var(--range-thumb-size)] [&::-webkit-slider-thumb]:w-[var(--range-thumb-size)]",
    "[&::-webkit-slider-thumb]:shadow-[0_0_0_8px_var(--ring-color)] [&::-webkit-slider-thumb]:transition-shadow [&::-webkit-slider-thumb]:duration-300",
    "focus:[&::-webkit-slider-thumb]:shadow-[0_0_0_8px_var(--ring-color-focus)]",
    "[&::-moz-range-thumb]:appearance-none [&::-moz-range-thumb]:rounded-full [&::-moz-range-thumb]:bg-current [&::-moz-range-thumb]:border-0 [&::-moz-range-thumb]:cursor-pointer",
    "[&::-moz-range-thumb]:h-[var(--range-thumb-size)] [&::-moz-range-thumb]:w-[var(--range-thumb-size)]",
    "[&::-moz-range-thumb]:shadow-[0_0_0_8px_var(--ring-color)] [&::-moz-range-thumb]:transition-shadow [&::-moz-range-thumb]:duration-300",
    "focus:[&::-moz-range-thumb]:shadow-[0_0_0_8px_var(--ring-color-focus)]", class,
  ].join(" ")
}

///|
pub fn get_slider_styles(
  thumb_height : Int,
  color_value : String,
  progress_percent : Double,
) -> Array[String] {
  [
    "--range-bg: color-mix(in oklab,currentColor 10%, transparent)",
    "--range-thumb-size: calc(var(--size-selector, .25rem) * \{thumb_height})",
    "--ring-color: transparent",
    "--ring-color-focus: color-mix(in oklab, " +
    color_value +
    " 20%, transparent)",
    "height: calc(var(--range-thumb-size) / 2)",
    "color: " + color_value,
    "background: linear-gradient(to right, currentColor 0%, currentColor \{progress_percent}%, var(--range-bg) \{progress_percent}%, var(--range-bg) 100%)",
  ]
}
