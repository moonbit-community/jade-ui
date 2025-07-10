///|
pub fn[M] progress(
  value~ : Int = 0,
  variant~ : @theme.ProgressVariant = Filled,
  color~ : @theme.ProgressColor = Primary,
  size~ : @theme.ProgressSize = Md,
  class~ : String = "",
  barClass~ : String = "",
  children? : Array[Html[M]]
) -> Html[M] {
  // ensure value is in 0-100 range
  let clamped_value = if value < 0 {
    0
  } else if value > 100 {
    100
  } else {
    value
  }

  // base styles
  let base_container_style = "w-full overflow-hidden rounded-full"
  let size_style = match size {
    Sm => "h-2"
    Md => "h-4"
    Lg => "h-6"
  }
  let container_style = [
    match color {
      Primary => "text-[var(--color-primary)]"
      Secondary => "text-[var(--color-secondary)]"
      Success => "text-[var(--color-success)]"
      Info => "text-[var(--color-info)]"
      Warning => "text-[var(--color-warning)]"
      Error => "text-[var(--color-error)]"
    },
    base_container_style,
    size_style,
    class,
  ].join(" ")

  // progress bar styles
  let base_bar_style = "h-full transition-all duration-300 ease-in-out"
  let color_style = match variant {
    Filled => "bg-[currentColor]"
    Gradient => "bg-gradient-to-r from-[currentColor] to-[currentColor]/80"
  }
  let bar_style = [
    base_bar_style,
    color_style,
    match barClass {
      cls => cls
    },
  ].join(" ")
  let width_style = ["width:" + clamped_value.to_string() + "%"]
  let container = @html.div(
    class=container_style,
    style=[
      "background-color: color-mix(in oklab, currentColor 20%, transparent)",
    ],
    [
      @html.div(
        class=bar_style,
        style=width_style,
        if children is Some(children) {
          children
        } else {
          []
        },
      ),
    ],
  )
  @html.div(class="w-full", [container])
}
