///|
enum Msg {
  Increment
  Decrement
  ToggleCheckbox1
  ToggleCheckbox2
  ToggleCheckbox3
  ToggleCheckbox4
  ToggleCheckbox5
  ToggleCheckbox6
}

///|
struct Model {
  count : Int
  checkbox1 : Bool
  checkbox2 : Bool
  checkbox3 : Bool
  checkbox4 : Bool
  checkbox5 : Bool
  checkbox6 : Bool
}

///|
fn max(a : Int, b : Int) -> Int {
  if a > b {
    a
  } else {
    b
  }
}

///|
fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match msg {
    Increment => (none(), { ..model, count: model.count + 1 })
    Decrement => (none(), { ..model, count: max(0, model.count - 1) })
    ToggleCheckbox1 =>
      (
        none(),
        { ..model, checkbox1: if model.checkbox1 { false } else { true } },
      )
    ToggleCheckbox2 =>
      (
        none(),
        { ..model, checkbox2: if model.checkbox2 { false } else { true } },
      )
    ToggleCheckbox3 =>
      (
        none(),
        { ..model, checkbox3: if model.checkbox3 { false } else { true } },
      )
    ToggleCheckbox4 =>
      (
        none(),
        { ..model, checkbox4: if model.checkbox4 { false } else { true } },
      )
    ToggleCheckbox5 =>
      (
        none(),
        { ..model, checkbox5: if model.checkbox5 { false } else { true } },
      )
    ToggleCheckbox6 =>
      (
        none(),
        { ..model, checkbox6: if model.checkbox6 { false } else { true } },
      )
  }
}

///|
fn view(model : Model) -> Html[Msg] {
  div(class="w-full min-h-screen p-8 bg-gray-50", [
    // Title
    h1(class="text-3xl font-bold text-center mb-8 text-gray-800", [
      text("Jade UI Component Style Showcase"),
    ]),

    // Counter section
    div(class="w-[600px] mx-auto mb-12", [
      h2(class="text-xl font-semibold mb-4 text-gray-700", [
        text("Counter Example"),
      ]),
      div(class="bg-white rounded-lg p-6 shadow-sm", [
        h3(class="text-2xl font-bold text-center select-none mb-4", [
          text("\{model.count}"),
        ]),
        div(class="flex justify-center gap-4", [
          @jade.button([text("+")], Increment, variant=Solid, color=Primary),
          @jade.button([text("-")], Decrement, variant=Solid, color=Primary),
        ]),
      ]),
    ]),

    // Checkbox style showcase
    div(class="max-w-6xl mx-auto mb-12", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Checkbox Component Styles"),
      ]),

      // Checkbox colors
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Checkbox Colors"),
        ]),
        div(class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6", [
          @jade.checkbox(
            model.checkbox1,
            ToggleCheckbox1,
            id="primary-checkbox",
            label=Some("Primary color checkbox"),
            color=Primary,
          ),
          @jade.checkbox(
            model.checkbox2,
            ToggleCheckbox2,
            id="secondary-checkbox",
            label=Some("Secondary color checkbox"),
            color=Secondary,
          ),
          @jade.checkbox(
            model.checkbox3,
            ToggleCheckbox3,
            id="info-checkbox",
            label=Some("Info color checkbox"),
            color=Info,
          ),
          @jade.checkbox(
            model.checkbox4,
            ToggleCheckbox4,
            id="success-checkbox",
            label=Some("Success color checkbox"),
            color=Success,
          ),
          @jade.checkbox(
            model.checkbox5,
            ToggleCheckbox5,
            id="warning-checkbox",
            label=Some("Warning color checkbox"),
            color=Warning,
          ),
          @jade.checkbox(
            model.checkbox6,
            ToggleCheckbox6,
            id="error-checkbox",
            label=Some("Error color checkbox"),
            color=Error,
          ),
        ]),
      ]),

      // Checkbox sizes
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Checkbox Sizes"),
        ]),
        div(class="flex items-center gap-6 flex-wrap", [
          @jade.checkbox(
            model.checkbox1,
            ToggleCheckbox1,
            id="small-checkbox",
            label=Some("Small checkbox"),
            size=Sm,
            color=Primary,
          ),
          @jade.checkbox(
            model.checkbox2,
            ToggleCheckbox2,
            id="medium-checkbox",
            label=Some("Medium checkbox"),
            size=Md,
            color=Primary,
          ),
          @jade.checkbox(
            model.checkbox3,
            ToggleCheckbox3,
            id="large-checkbox",
            label=Some("Large checkbox"),
            size=Lg,
            color=Primary,
          ),
        ]),
      ]),

      // Checkbox states
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Checkbox States"),
        ]),
        div(class="grid grid-cols-1 md:grid-cols-2 gap-6", [
          div(class="space-y-4", [
            h4(class="text-md font-medium text-gray-600", [
              text("Disabled Checkboxes"),
            ]),
            @jade.checkbox(
              true,
              ToggleCheckbox1,
              label=Some("Disabled checked"),
              color=Primary,
              disabled=true,
            ),
            @jade.checkbox(
              false,
              ToggleCheckbox2,
              label=Some("Disabled unchecked"),
              color=Success,
              disabled=true,
            ),
          ]),
        ]),
      ]),
    ]),

    // Button style showcase
    div(class="max-w-6xl mx-auto mb-12", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Button Component Styles"),
      ]),

      // Button variants with all colors
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Button Variants with All Colors"),
        ]),

        // Ghost variant
        div(class="mb-6", [
          h4(class="text-md font-medium mb-3 text-gray-600", [
            text("Ghost Variant"),
          ]),
          div(class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-3", [
            @jade.button(
              [text("Primary")],
              Increment,
              variant=Ghost,
              color=Primary,
            ),
            @jade.button(
              [text("Secondary")],
              Increment,
              variant=Ghost,
              color=Secondary,
            ),
            @jade.button([text("Info")], Increment, variant=Ghost, color=Info),
            @jade.button(
              [text("Success")],
              Increment,
              variant=Ghost,
              color=Success,
            ),
            @jade.button(
              [text("Warning")],
              Increment,
              variant=Ghost,
              color=Warning,
            ),
            @jade.button([text("Error")], Increment, variant=Ghost, color=Error),
          ]),
        ]),

        // Outlined variant
        div(class="mb-6", [
          h4(class="text-md font-medium mb-3 text-gray-600", [
            text("Outlined Variant"),
          ]),
          div(class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-3", [
            @jade.button(
              [text("Primary")],
              Increment,
              variant=Outlined,
              color=Primary,
            ),
            @jade.button(
              [text("Secondary")],
              Increment,
              variant=Outlined,
              color=Secondary,
            ),
            @jade.button(
              [text("Info")],
              Increment,
              variant=Outlined,
              color=Info,
            ),
            @jade.button(
              [text("Success")],
              Increment,
              variant=Outlined,
              color=Success,
            ),
            @jade.button(
              [text("Warning")],
              Increment,
              variant=Outlined,
              color=Warning,
            ),
            @jade.button(
              [text("Error")],
              Increment,
              variant=Outlined,
              color=Error,
            ),
          ]),
        ]),

        // Solid variant
        div(class="mb-6", [
          h4(class="text-md font-medium mb-3 text-gray-600", [
            text("Solid Variant"),
          ]),
          div(class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-3", [
            @jade.button(
              [text("Primary")],
              Increment,
              variant=Solid,
              color=Primary,
            ),
            @jade.button(
              [text("Secondary")],
              Increment,
              variant=Solid,
              color=Secondary,
            ),
            @jade.button([text("Info")], Increment, variant=Solid, color=Info),
            @jade.button(
              [text("Success")],
              Increment,
              variant=Solid,
              color=Success,
            ),
            @jade.button(
              [text("Warning")],
              Increment,
              variant=Solid,
              color=Warning,
            ),
            @jade.button([text("Error")], Increment, variant=Solid, color=Error),
          ]),
        ]),

        // Gradient variant
        div(class="mb-6", [
          h4(class="text-md font-medium mb-3 text-gray-600", [
            text("Gradient Variant"),
          ]),
          div(class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-3", [
            @jade.button(
              [text("Primary")],
              Increment,
              variant=Gradient,
              color=Primary,
            ),
            @jade.button(
              [text("Secondary")],
              Increment,
              variant=Gradient,
              color=Secondary,
            ),
            @jade.button(
              [text("Info")],
              Increment,
              variant=Gradient,
              color=Info,
            ),
            @jade.button(
              [text("Success")],
              Increment,
              variant=Gradient,
              color=Success,
            ),
            @jade.button(
              [text("Warning")],
              Increment,
              variant=Gradient,
              color=Warning,
            ),
            @jade.button(
              [text("Error")],
              Increment,
              variant=Gradient,
              color=Error,
            ),
          ]),
        ]),
      ]),

      // Button sizes
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Button Sizes"),
        ]),
        div(class="flex items-center gap-4 flex-wrap", [
          @jade.button(
            [text("Extra Small")],
            Increment,
            variant=Solid,
            color=Primary,
            size=Xs,
          ),
          @jade.button(
            [text("Small")],
            Increment,
            variant=Solid,
            color=Primary,
            size=Sm,
          ),
          @jade.button(
            [text("Medium")],
            Increment,
            variant=Solid,
            color=Primary,
            size=Md,
          ),
          @jade.button(
            [text("Large")],
            Increment,
            variant=Solid,
            color=Primary,
            size=Lg,
          ),
          @jade.button(
            [text("Extra Large")],
            Increment,
            variant=Solid,
            color=Primary,
            size=Xl,
          ),
        ]),
      ]),

      // Button full width
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Button Full Width"),
        ]),
        @jade.button(
          [text("Full Width Button")],
          Increment,
          variant=Solid,
          color=Primary,
          fullWidth=true,
        ),
      ]),

      // Button size comparison with different variants
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Size Comparison Across Variants"),
        ]),

        // Xs size
        div(class="mb-4", [
          h4(class="text-md font-medium mb-2 text-gray-600", [
            text("Extra Small (Xs)"),
          ]),
          div(class="flex items-center gap-3 flex-wrap", [
            @jade.button(
              [text("Ghost")],
              Increment,
              variant=Ghost,
              color=Primary,
              size=Xs,
            ),
            @jade.button(
              [text("Outlined")],
              Increment,
              variant=Outlined,
              color=Primary,
              size=Xs,
            ),
            @jade.button(
              [text("Solid")],
              Increment,
              variant=Solid,
              color=Primary,
              size=Xs,
            ),
            @jade.button(
              [text("Gradient")],
              Increment,
              variant=Gradient,
              color=Primary,
              size=Xs,
            ),
          ]),
        ]),

        // Sm size
        div(class="mb-4", [
          h4(class="text-md font-medium mb-2 text-gray-600", [
            text("Small (Sm)"),
          ]),
          div(class="flex items-center gap-3 flex-wrap", [
            @jade.button(
              [text("Ghost")],
              Increment,
              variant=Ghost,
              color=Primary,
              size=Sm,
            ),
            @jade.button(
              [text("Outlined")],
              Increment,
              variant=Outlined,
              color=Primary,
              size=Sm,
            ),
            @jade.button(
              [text("Solid")],
              Increment,
              variant=Solid,
              color=Primary,
              size=Sm,
            ),
            @jade.button(
              [text("Gradient")],
              Increment,
              variant=Gradient,
              color=Primary,
              size=Sm,
            ),
          ]),
        ]),

        // Md size
        div(class="mb-4", [
          h4(class="text-md font-medium mb-2 text-gray-600", [
            text("Medium (Md)"),
          ]),
          div(class="flex items-center gap-3 flex-wrap", [
            @jade.button(
              [text("Ghost")],
              Increment,
              variant=Ghost,
              color=Primary,
              size=Md,
            ),
            @jade.button(
              [text("Outlined")],
              Increment,
              variant=Outlined,
              color=Primary,
              size=Md,
            ),
            @jade.button(
              [text("Solid")],
              Increment,
              variant=Solid,
              color=Primary,
              size=Md,
            ),
            @jade.button(
              [text("Gradient")],
              Increment,
              variant=Gradient,
              color=Primary,
              size=Md,
            ),
          ]),
        ]),

        // Lg size
        div(class="mb-4", [
          h4(class="text-md font-medium mb-2 text-gray-600", [
            text("Large (Lg)"),
          ]),
          div(class="flex items-center gap-3 flex-wrap", [
            @jade.button(
              [text("Ghost")],
              Increment,
              variant=Ghost,
              color=Primary,
              size=Lg,
            ),
            @jade.button(
              [text("Outlined")],
              Increment,
              variant=Outlined,
              color=Primary,
              size=Lg,
            ),
            @jade.button(
              [text("Solid")],
              Increment,
              variant=Solid,
              color=Primary,
              size=Lg,
            ),
            @jade.button(
              [text("Gradient")],
              Increment,
              variant=Gradient,
              color=Primary,
              size=Lg,
            ),
          ]),
        ]),

        // Xl size
        div(class="mb-4", [
          h4(class="text-md font-medium mb-2 text-gray-600", [
            text("Extra Large (Xl)"),
          ]),
          div(class="flex items-center gap-3 flex-wrap", [
            @jade.button(
              [text("Ghost")],
              Increment,
              variant=Ghost,
              color=Primary,
              size=Xl,
            ),
            @jade.button(
              [text("Outlined")],
              Increment,
              variant=Outlined,
              color=Primary,
              size=Xl,
            ),
            @jade.button(
              [text("Solid")],
              Increment,
              variant=Solid,
              color=Primary,
              size=Xl,
            ),
            @jade.button(
              [text("Gradient")],
              Increment,
              variant=Gradient,
              color=Primary,
              size=Xl,
            ),
          ]),
        ]),
      ]),
    ]),

    // Card style showcase
    div(class="max-w-6xl mx-auto", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Card Component Styles"),
      ]),

      // Card variants
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Card Variants"),
        ]),
        div(class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6", [
          @jade.card(
            [
              @jade.card_header([h4(class="font-semibold", [text("Ghost")])]),
              @jade.card_body([text("This is a Ghost style card")]),
              @jade.card_footer([
                @jade.button(
                  [text("Action")],
                  Increment,
                  variant=Solid,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Ghost,
          ),
          @jade.card(
            [
              @jade.card_header([h4(class="font-semibold", [text("Solid")])]),
              @jade.card_body([text("This is a Solid style card")]),
              @jade.card_footer([
                @jade.button(
                  [text("Action")],
                  Increment,
                  variant=Solid,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Solid,
          ),
          @jade.card(
            [
              @jade.card_header([h4(class="font-semibold", [text("Outline")])]),
              @jade.card_body([text("This is an Outline style card")]),
              @jade.card_footer([
                @jade.button(
                  [text("Action")],
                  Increment,
                  variant=Solid,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Outline,
          ),
          @jade.card(
            [
              @jade.card_header([h4(class="font-semibold", [text("Gradient")])]),
              @jade.card_body([text("This is a Gradient style card")]),
              @jade.card_footer([
                @jade.button(
                  [text("Action")],
                  Increment,
                  variant=Solid,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Gradient,
          ),
        ]),
      ]),

      // Card colors
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Card Colors"),
        ]),
        div(class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6", [
          @jade.card(
            [
              @jade.card_header([h4(class="font-semibold", [text("Default")])]),
              @jade.card_body([text("Default color card")]),
              @jade.card_footer([
                @jade.button(
                  [text("Action")],
                  Increment,
                  variant=Solid,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Solid,
            color=Default,
          ),
          @jade.card(
            [
              @jade.card_header([h4(class="font-semibold", [text("Primary")])]),
              @jade.card_body([text("Primary color card")]),
              @jade.card_footer([
                @jade.button(
                  [text("Action")],
                  Increment,
                  variant=Solid,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Solid,
            color=Primary,
          ),
          @jade.card(
            [
              @jade.card_header([h4(class="font-semibold", [text("Success")])]),
              @jade.card_body([text("Success color card")]),
              @jade.card_footer([
                @jade.button(
                  [text("Action")],
                  Increment,
                  variant=Solid,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Solid,
            color=Success,
          ),
          @jade.card(
            [
              @jade.card_header([h4(class="font-semibold", [text("Error")])]),
              @jade.card_body([text("Error color card")]),
              @jade.card_footer([
                @jade.button(
                  [text("Action")],
                  Increment,
                  variant=Solid,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Solid,
            color=Error,
          ),
        ]),
      ]),

      // Card combination showcase
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Card Combination Showcase"),
        ]),
        div(class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6", [
          @jade.card(
            [
              @jade.card_header([h4(class="font-semibold", [text("Info Card")])]),
              @jade.card_body([
                text(
                  "This is an info type card using Info color and Outline variant.",
                ),
              ]),
              @jade.card_footer([
                div(class="flex gap-2", [
                  @jade.button(
                    [text("Confirm")],
                    Increment,
                    variant=Solid,
                    color=Primary,
                    size=Sm,
                  ),
                  @jade.button(
                    [text("Cancel")],
                    Decrement,
                    variant=Ghost,
                    color=Primary,
                    size=Sm,
                  ),
                ]),
              ]),
            ],
            variant=Outline,
            color=Info,
          ),
          @jade.card(
            [
              @jade.card_header([
                h4(class="font-semibold", [text("Warning Card")]),
              ]),
              @jade.card_body([
                text(
                  "This is a warning type card using Warning color and Solid variant.",
                ),
              ]),
              @jade.card_footer([
                div(class="flex gap-2", [
                  @jade.button(
                    [text("Confirm")],
                    Increment,
                    variant=Solid,
                    color=Primary,
                    size=Sm,
                  ),
                  @jade.button(
                    [text("Cancel")],
                    Decrement,
                    variant=Outlined,
                    color=Primary,
                    size=Sm,
                  ),
                ]),
              ]),
            ],
            variant=Solid,
            color=Warning,
          ),
          @jade.card(
            [
              @jade.card_header([
                h4(class="font-semibold", [text("Gradient Card")]),
              ]),
              @jade.card_body([
                text(
                  "This is a gradient type card using Secondary color and Gradient variant.",
                ),
              ]),
              @jade.card_footer([
                div(class="flex gap-2", [
                  @jade.button(
                    [text("Confirm")],
                    Increment,
                    variant=Gradient,
                    color=Primary,
                    size=Sm,
                  ),
                  @jade.button(
                    [text("Cancel")],
                    Decrement,
                    variant=Ghost,
                    color=Primary,
                    size=Sm,
                  ),
                ]),
              ]),
            ],
            variant=Gradient,
            color=Secondary,
          ),
        ]),
      ]),
    ]),
  ])
}

///| NOTE: This program is only available in the js backend, 
/// see README.md to getting started.
fn main {
  @theme.light().apply()
  let model = {
    count: 0,
    checkbox1: true,
    checkbox2: true,
    checkbox3: true,
    checkbox4: true,
    checkbox5: true,
    checkbox6: true,
  }
  @tea.startup(model~, update~, view~)
}
