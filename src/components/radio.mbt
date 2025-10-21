///|
/// Creates a configurable radio button component with customizable styling and
/// behavior.
///
/// Parameters:
///
/// * `checked` : Bool - Whether the radio button is checked.
/// * `on_change` : M - The message or action to be dispatched when the radio
///   state changes.
/// * `label` : String? - Optional label text to display next to the radio button.
/// * `size` : @theme.RadioSize - The size of the radio button. Defaults to
///   `@theme.Md`.
/// * `color` : @theme.RadioColor - The color theme of the radio button. Defaults to
///   `@theme.Primary`.
/// * `disabled` : Bool - Whether the radio button is disabled. Defaults to `false`.
/// * `class` : String? - Additional CSS class name to apply to the radio button.
///   Defaults to `None`.
///
/// Returns an HTML radio button element configured with the specified properties and
/// styling.
///
/// Example:
///
/// ```moonbit skip
/// let my_radio = @jade.radio(
///   checked=true,
///   change=MyRadioMessage,
///   label="Option A",
///   size=Lg,
///   color=Success
/// )
/// ```
///
pub fn[M] radio(
  checked : Bool,
  change : M,
  id? : String,
  name? : String,
  value? : String,
  label? : String,
  size? : @theme.RadioSize = @theme.Md,
  color? : @theme.RadioColor = @theme.Primary,
  disabled? : Bool = false,
  class? : String,
) -> @html.Html[M] {
  let hidden_input = @html.input(
    input_type=Radio,
    class="sr-only peer",
    id?,
    name?,
    value?,
    checked~,
    change=_ => change,
  )

  // 可视化的圆形和内部圆点
  let visual_circle = @html.span(
    class=@theme.get_radio_visual_style(size~, color~, disabled~),
    [@html.span(class=@theme.get_radio_dot_style(size~), [])],
  )

  // 主容器 label
  let radio_container = @html.label(
    class=@theme.get_radio_container_style(disabled~, class~),
    for_?=id,
    [hidden_input, visual_circle],
  )
  match label {
    Some(label_text) =>
      @html.div(class="inline-flex items-center gap-2", [
        radio_container,
        @html.label(
          class=@theme.get_radio_label_style(size~, disabled~),
          for_?=id,
          [@html.text(label_text)],
        ),
      ])
    None => radio_container
  }
}
