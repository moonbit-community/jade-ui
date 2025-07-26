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
  on_change : M,
  id? : String,
  name? : String,
  label~ : String? = None,
  size~ : @theme.CheckboxSize = @theme.Md,
  color~ : @theme.CheckboxColor = @theme.Primary,
  disabled~ : Bool = false,
  class~ : String? = None,
) -> @html.Html[M] {
  let container_style = @theme.get_checkbox_container_style(
    size~,
    color~,
    disabled~,
    class~,
  )
  let indicator_style = @theme.get_checkbox_indicator_style()
  let checkbox_input = @html.input(
    input_type=Checkbox,
    id?,
    name?,
    checked~,
    style=["display: none"],
    change=fn(_) { on_change },
  )
  let checkbox_indicator = @html.node(
    "span",
    [
      @html.attribute("data-checked", if checked { "true" } else { "false" }),
      @html.attribute("class", indicator_style),
    ],
    [
      @svg.svg(
        [
          @svg.attribute("fill", "none"),
          @svg.attribute("width", "18px"),
          @svg.attribute("height", "18px"),
          @svg.attribute("strokeWidth", "2"),
          @svg.attribute("color", "currentColor"),
          @svg.attribute("viewBox", "0 0 24 24"),
          @svg.attribute("xmlns", "http://www.w3.org/2000/svg"),
        ],
        [
          @svg.node(
            "path",
            [
              @svg.attribute("d", "M5 13L9 17L19 7"),
              @svg.attribute("stroke", "currentColor"),
              @svg.attribute("strokeWidth", "2"),
              @svg.attribute("strokeLinecap", "round"),
              @svg.attribute("strokeLinejoin", "round"),
            ],
            [],
          ),
        ],
      ),
      // @svg.from_string(
      //   #|<svg
      //   #|  fill="none"
      //   #|  width="18px"
      //   #|  height="18px"
      //   #|  strokeWidth="2"
      //   #|  color="currentColor"
      //   #|  viewBox="0 0 24 24"
      //   #|  xmlns="http://www.w3.org/2000/svg"
      //   #|>
      //   #|  <path
      //   #|    d="M5 13L9 17L19 7"
      //   #|    stroke="currentColor"
      //   #|    strokeWidth="2"
      //   #|    strokeLinecap="round"
      //   #|    strokeLinejoin="round"
      //   #|  />
      //   #|</svg>
      //   ,
      // ),
    ],
  )
  let attributes = [
    @html.attribute("class", container_style),
    @html.attribute("data-checked", if checked { "true" } else { "false" }),
  ]
  let label_attributes = [
    @html.attribute(
      "class",
      @theme.get_checkbox_label_style(size~, disabled~, class~),
    ),
  ]
  if disabled {
    attributes.push(@html.attribute("aria-disabled", "true"))
  }
  if id is Some(id) {
    attributes.push(@html.attribute("for", id))
    label_attributes.push(@html.attribute("for", id))
  }
  let checkbox_label = @html.node("label", attributes, [
    checkbox_input, checkbox_indicator,
  ])
  match label {
    Some(label_text) =>
      @html.div(class="inline-flex items-center gap-2", [
        checkbox_label,
        @html.label(class="text-sm font-medium", [@html.text(label_text)]),
      ])
    None => checkbox_label
  }
}
