///|
pub fn[M] slider(
  value~ : Int = 0,
  min~ : Int = 0,
  max~ : Int = 100,
  on_input~ : (Int) -> M,
  color~ : @theme.SliderColor = Primary,
  size~ : @theme.SliderSize = Md,
  class~ : String = "",
  childrens? : Array[Html[M]]
) -> Html[M] {
  // ensure value is in range
  let clamped_value = if value < min {
    min
  } else if value > max {
    max
  } else {
    value
  }

  // calculate progress percentage
  let progress_percent = if max - min == 0 {
    0
  } else {
    (clamped_value - min) * 100 / (max - min)
  }

  // get color value
  let color_value = match color {
    Primary => "var(--color-primary)"
    Secondary => "var(--color-secondary)"
    Info => "var(--color-info)"
    Success => "var(--color-success)"
    Warning => "var(--color-warning)"
    Error => "var(--color-error)"
  }

  // get thumb size based on slider size
  let thumb_height = match size {
    Xs => 2
    Sm => 3
    Md => 4
    Lg => 5
    Xl => 6
  }
  @html.input(
    input_type=Range,
    input=v => on_input((try? @strconv.parse_int(v)).or(value)),
    min~,
    max~,
    value=clamped_value.to_string(),
    class=[
      "w-full appearance-none bg-gray-300 rounded-full", "[&::-webkit-slider-thumb]:appearance-none",
      "[&::-webkit-slider-thumb]:rounded-full", "[&::-webkit-slider-thumb]:bg-[currentColor]",
      "[&::-webkit-slider-thumb]:border-none", "[&::-webkit-slider-thumb]:cursor-pointer",
      "[&::-webkit-slider-thumb]:h-[var(--range-thumb-size)]", "[&::-webkit-slider-thumb]:w-[var(--range-thumb-size)]",
      "[&::-moz-range-thumb]:appearance-none", "[&::-moz-range-thumb]:rounded-full",
      "[&::-moz-range-thumb]:border-none", "[&::-moz-range-thumb]:cursor-pointer",
      "[&::-moz-range-thumb]:h-[var(--range-thumb-size)]", "[&::-moz-range-thumb]:w-[var(--range-thumb-size)]",
      class,
    ].join(" "),
    style=[
      "--range-bg: color-mix(in oklab,currentColor 10%, transparent)",
      "--range-thumb-size: calc(var(--size-selector, .25rem) * \{thumb_height});",
      "height: calc(var(--range-thumb-size) / 2)",
      "color: " + color_value,
      "background: linear-gradient(to right, currentColor 0%, currentColor \{progress_percent}%, var(--range-bg) \{progress_percent}%, var(--range-bg) 100%)",
    ],
    childrens=childrens.unwrap_or([]),
  )
}
