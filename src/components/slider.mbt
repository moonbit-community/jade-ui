///|
pub fn[M] slider(
  value? : Int = 0,
  min? : Int = 0,
  max? : Int = 100,
  on_input~ : (Int) -> M,
  color? : @theme.SliderColor = Primary,
  size? : @theme.SliderSize = Md,
  class? : String = "",
  childrens? : Array[Html[M]],
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
  let progress_percent = if max == min {
    0.0
  } else {
    (clamped_value - min).to_double() * 100.0 / (max - min).to_double()
  }

  // get styling values from theme
  let color_value = @theme.get_slider_color_value(color)
  let thumb_height = @theme.get_slider_thumb_height(size)
  @html.input(
    input_type=Range,
    input=v => on_input((try? @strconv.parse_int(v)).or(value)),
    min~,
    max~,
    value=clamped_value.to_string(),
    class=@theme.get_slider_classes(class),
    style=@theme.get_slider_styles(thumb_height, color_value, progress_percent),
    childrens=childrens.unwrap_or([]),
  )
}
