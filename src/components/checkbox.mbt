///|
/// Creates a configurable checkbox component with customizable styling and
/// behavior.
///
/// Parameters:
///
/// * `checked` : Bool - Whether the checkbox is checked.
/// * `on_change` : M - The message or action to be dispatched when the checkbox
///   state changes.
/// * `label` : String? - Optional label text to display next to the checkbox.
/// * `size` : @theme.CheckboxSize - The size of the checkbox. Defaults to
///   `@theme.Md`.
/// * `color` : @theme.CheckboxColor - The color theme of the checkbox. Defaults to
///   `@theme.Primary`.
/// * `disabled` : Bool - Whether the checkbox is disabled. Defaults to `false`.
/// * `class` : String? - Additional CSS class name to apply to the checkbox.
///   Defaults to `None`.
///
/// Returns an HTML checkbox element configured with the specified properties and
/// styling.
///
/// Example:
///
/// ```moonbit
/// let my_checkbox = @jade.checkbox(
///   checked=true,
///   on_change=MyCheckboxMessage,
///   label=Some("Accept terms"),
///   size=Lg,
///   color=Success
/// )
/// ```
///
pub fn[M] checkbox(
  checked : Bool,
  change : M,
  id? : String,
  name? : String,
  label? : String,
  size? : @theme.CheckboxSize = @theme.Md,
  color? : @theme.CheckboxColor = @theme.Primary,
  disabled? : Bool = false,
  class? : String,
) -> @html.Html[M] {
  let hidden_input = @html.input(
    input_type=Checkbox,
    class="sr-only peer",
    id?,
    name?,
    checked~,
    change=_ => change,
  )

  // 可视化的方框和勾选图标
  let visual_box = @html.span(
    class=@theme.get_checkbox_visual_style(size~, color~, disabled~),
    [
      @html.span(
        class="w-1.5 h-3 mb-0.5 ml-0.2 border-r-2 border-b-2 border-white rotate-45 opacity-0 peer-checked:bg-red opacity-100 transition-opacity",
        [],
      ),
    ],
  )

  // 主容器 label
  let checkbox_container = @html.label(
    class=@theme.get_checkbox_container_style(disabled~, class~),
    for_?=id,
    [hidden_input, visual_box],
  )
  match label {
    Some(label_text) =>
      @html.div(class="inline-flex items-center gap-2", [
        checkbox_container,
        @html.label(
          class=@theme.get_checkbox_label_style(size~, disabled~),
          for_?=id,
          [@html.text(label_text)],
        ),
      ])
    None => checkbox_container
  }
}
