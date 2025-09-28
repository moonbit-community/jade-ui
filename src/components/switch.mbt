///|
/// Creates a configurable switch component for toggling boolean states.
///
/// Parameters:
///
/// * `checked` : Bool - The current state of the switch (on/off).
/// * `on_change` : (Bool) -> M - The message or action to be dispatched when the switch state changes.
/// * `color` : @theme.SwitchColor - The color theme of the switch. Defaults to `@theme.Primary`.
/// * `disabled` : Bool - Whether the switch is disabled. Defaults to `false`.
/// * `class` : String? - Additional CSS class name to apply to the switch. Defaults to `None`.
/// * `id` : String? - The HTML id attribute for the switch. Defaults to `None`.
///
/// Returns an HTML input element configured as a switch with the specified properties and styling.
///
/// Example:
///
/// ```moonbit skip
/// enum Msg {
///   ToggleSwitch(Bool)
/// }
/// 
/// let _ = switch(
///   checked=true,
///   on_change=ToggleSwitch,
///   color=Success,
///   disabled=false
/// )
/// ```
///
pub fn[M] switch(
  checked? : Bool = false,
  change~ : M,
  color? : @theme.SwitchColor = @theme.Primary,
  class? : String,
  id? : String,
) -> @html.Html[M] {
  let klass = @theme.get_switch_style(color~, class?)
  @html.input(input_type=Checkbox, checked~, class=klass, id?, change=fn(_) {
    change
  })
}
