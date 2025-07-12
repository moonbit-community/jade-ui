///|
enum Msg {
  Increment
  Decrement
  SliderUpdate(Int)
  InputUpdate(String)
}

///|
struct Model {
  count : Int
  inputValue : String
}

///|
fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match msg {
    Increment => (none(), { ..model, count: model.count + 1 })
    Decrement => (none(), { ..model, count: @cmp.maximum(0, model.count - 1) })
    SliderUpdate(value) => (none(), { ..model, count: value })
    InputUpdate(value) => (none(), { ..model, inputValue: value })
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

    // Button style showcase
    div(class="max-w-7xl mx-auto mb-12", [
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
    div(class="max-w-6xl mx-auto mb-12", [
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

    // Typography style showcase
    div(class="max-w-6xl mx-auto", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Typography Component Styles"),
      ]),

      // Typography headings
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Heading Styles"),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm space-y-4", [
          @jade.typography(tag=H1, [text("Heading 1 - The largest heading")]),
          @jade.typography(tag=H2, [text("Heading 2 - Secondary heading")]),
          @jade.typography(tag=H3, [text("Heading 3 - Tertiary heading")]),
          @jade.typography(tag=H4, [text("Heading 4 - Quaternary heading")]),
          @jade.typography(tag=H5, [text("Heading 5 - Quinary heading")]),
          @jade.typography(tag=H6, [text("Heading 6 - The smallest heading")]),
        ]),
      ]),

      // Typography colors
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Typography Colors"),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm space-y-4", [
          @jade.typography(tag=P, color=Inherit, [
            text(
              "Inherit color - This text inherits the color from its parent element.",
            ),
          ]),
          @jade.typography(tag=P, color=Default, [
            text(
              "Default color - This is the default text color for the theme.",
            ),
          ]),
          @jade.typography(tag=P, color=Primary, [
            text("Primary color - This text uses the primary theme color."),
          ]),
          @jade.typography(tag=P, color=Secondary, [
            text("Secondary color - This text uses the secondary theme color."),
          ]),
          @jade.typography(tag=P, color=Success, [
            text("Success color - This text indicates successful operations."),
          ]),
          @jade.typography(tag=P, color=Info, [
            text("Info color - This text provides informational content."),
          ]),
          @jade.typography(tag=P, color=Warning, [
            text("Warning color - This text indicates caution or warnings."),
          ]),
          @jade.typography(tag=P, color=Error, [
            text("Error color - This text indicates errors or problems."),
          ]),
        ]),
      ]),

      // Typography content types
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Content Types"),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm space-y-4", [
          @jade.typography(tag=Lead, [
            text(
              "This is a lead paragraph that introduces the main content. Lead text is typically larger and more prominent to draw attention.",
            ),
          ]),
          @jade.typography(tag=P, [
            text(
              "This is a regular paragraph. It contains the main body text and should be easy to read with appropriate line height and spacing. Regular paragraphs form the bulk of most content.",
            ),
          ]),
          @jade.typography(tag=Small, [
            text(
              "This is small text, typically used for disclaimers, captions, or secondary information that should be less prominent.",
            ),
          ]),
        ]),
      ]),
    ]),
    // Slider style showcase
    div(class="max-w-6xl mx-auto", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Slider Component Styles"),
      ]),

      // Slider colors
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Slider Colors"),
        ]),
        div(class="space-y-6", [
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Primary Color"),
            ]),
            @jade.slider(
              value=model.count,
              min=0,
              max=100,
              color=Primary,
              size=Md,
              on_input=SliderUpdate(_),
            ),
            @html.p(class="text-sm text-gray-500 mt-2", [
              @html.text("Value: \{model.count}"),
            ]),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Secondary Color"),
            ]),
            @jade.slider(
              value=model.count,
              min=0,
              max=100,
              color=Secondary,
              size=Md,
              on_input=SliderUpdate(_),
            ),
            @html.p(class="text-sm text-gray-500 mt-2", [
              @html.text("Value: \{model.count}"),
            ]),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Success Color"),
            ]),
            @jade.slider(
              value=model.count,
              min=0,
              max=100,
              color=Success,
              size=Md,
              on_input=SliderUpdate(_),
            ),
            @html.p(class="text-sm text-gray-500 mt-2", [
              @html.text("Value: \{model.count}"),
            ]),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Info Color"),
            ]),
            @jade.slider(
              value=model.count,
              min=0,
              max=100,
              color=Info,
              size=Md,
              on_input=SliderUpdate(_),
            ),
            @html.p(class="text-sm text-gray-500 mt-2", [
              @html.text("Value: \{model.count}"),
            ]),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Warning Color"),
            ]),
            @jade.slider(
              value=model.count,
              min=0,
              max=100,
              color=Warning,
              size=Md,
              on_input=SliderUpdate(_),
            ),
            @html.p(class="text-sm text-gray-500 mt-2", [
              @html.text("Value: \{model.count}"),
            ]),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Error Color"),
            ]),
            @jade.slider(
              value=model.count,
              min=0,
              max=100,
              color=Error,
              size=Md,
              on_input=SliderUpdate(_),
            ),
            @html.p(class="text-sm text-gray-500 mt-2", [
              @html.text("Value: \{model.count}"),
            ]),
          ]),
        ]),
      ]),

      // Slider sizes
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Slider Sizes"),
        ]),
        div(class="space-y-6", [
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Extra Small (Xs)"),
            ]),
            @jade.slider(
              value=model.count,
              min=0,
              max=100,
              color=Primary,
              size=Xs,
              on_input=SliderUpdate(_),
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Small (Sm)"),
            ]),
            @jade.slider(
              value=model.count,
              min=0,
              max=100,
              color=Primary,
              size=Sm,
              on_input=SliderUpdate(_),
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Medium (Md)"),
            ]),
            @jade.slider(
              value=model.count,
              min=0,
              max=100,
              color=Primary,
              size=Md,
              on_input=SliderUpdate(_),
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Large (Lg)"),
            ]),
            @jade.slider(
              value=model.count,
              min=0,
              max=100,
              color=Primary,
              size=Lg,
              on_input=SliderUpdate(_),
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Extra Large (Xl)"),
            ]),
            @jade.slider(
              value=model.count,
              min=0,
              max=100,
              color=Primary,
              size=Xl,
              on_input=SliderUpdate(_),
            ),
          ]),
        ]),
      ]),

      // Slider with different ranges
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Slider with Different Ranges"),
        ]),
        div(class="space-y-6", [
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Range 0-100 (Default)"),
            ]),
            @jade.slider(
              value=model.count,
              min=0,
              max=100,
              color=Primary,
              size=Md,
              on_input=SliderUpdate(_),
            ),
            @html.p(class="text-sm text-gray-500 mt-2", [
              @html.text("Min: 0, Max: 100, Value: \{model.count}"),
            ]),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Range 0-50"),
            ]),
            @jade.slider(
              value=model.count,
              min=0,
              max=50,
              color=Success,
              size=Md,
              on_input=SliderUpdate(_),
            ),
            @html.p(class="text-sm text-gray-500 mt-2", [
              @html.text("Min: 0, Max: 50, Value: \{model.count}"),
            ]),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Range 10-90"),
            ]),
            @jade.slider(
              value=model.count,
              min=10,
              max=90,
              color=Warning,
              size=Md,
              on_input=SliderUpdate(_),
            ),
            @html.p(class="text-sm text-gray-500 mt-2", [
              @html.text("Min: 10, Max: 90, Value: \{model.count}"),
            ]),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Range 0-200"),
            ]),
            @jade.slider(
              value=model.count,
              min=0,
              max=200,
              color=Info,
              size=Md,
              on_input=SliderUpdate(_),
            ),
            @html.p(class="text-sm text-gray-500 mt-2", [
              @html.text("Min: 0, Max: 200, Value: \{model.count}"),
            ]),
          ]),
        ]),
      ]),

      // Slider in cards
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Slider in Cards"),
        ]),
        div(class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6", [
          @jade.card([
            @jade.card_header([
              h4(class="font-semibold", [text("Volume Control")]),
            ]),
            @jade.card_body([
              div(class="space-y-4", [
                @html.label(class="text-sm font-medium text-gray-700", [
                  @html.text("Master Volume"),
                ]),
                @jade.slider(
                  value=model.count,
                  min=0,
                  max=100,
                  color=Primary,
                  size=Md,
                  on_input=SliderUpdate(_),
                ),
                @html.label(class="text-sm font-medium text-gray-700", [
                  @html.text("Bass"),
                ]),
                @jade.slider(
                  value=model.count,
                  min=0,
                  max=100,
                  color=Success,
                  size=Sm,
                  on_input=SliderUpdate(_),
                ),
                @html.label(class="text-sm font-medium text-gray-700", [
                  @html.text("Treble"),
                ]),
                @jade.slider(
                  value=model.count,
                  min=0,
                  max=100,
                  color=Warning,
                  size=Sm,
                  on_input=SliderUpdate(_),
                ),
              ]),
            ]),
            @jade.card_footer([
              @jade.button(
                [text("Read More")],
                Increment,
                variant=Solid,
                color=Primary,
                size=Sm,
              ),
            ]),
          ]),
        ]),
      ]),
    ]),

    // Input style showcase
    div(class="max-w-6xl mx-auto", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Input Component Styles"),
      ]),

      // Input variants
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Input Variants"),
        ]),
        div(class="space-y-4", [
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Ghost Variant"),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Enter text...",
              variant=Ghost,
              color=Primary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Outlined Variant"),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Enter text...",
              variant=Outlined,
              color=Primary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Solid Variant"),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Enter text...",
              variant=Solid,
              color=Primary,
            ),
          ]),
        ]),
      ]),

      // Input colors
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Input Colors"),
        ]),
        div(class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4", [
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [text("Primary")]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Primary color",
              color=Primary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Secondary"),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Secondary color",
              color=Secondary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [text("Success")]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Success color",
              color=Success,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [text("Info")]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Info color",
              color=Info,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [text("Warning")]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Warning color",
              color=Warning,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [text("Error")]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Error color",
              color=Error,
            ),
          ]),
        ]),
      ]),

      // Input sizes
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Input Sizes"),
        ]),
        div(class="space-y-4", [
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Extra Small (Xs)"),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Extra small input",
              size=Xs,
              color=Primary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Small (Sm)"),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Small input",
              size=Sm,
              color=Primary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Medium (Md)"),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Medium input",
              size=Md,
              color=Primary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Large (Lg)"),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Large input",
              size=Lg,
              color=Primary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Extra Large (Xl)"),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Extra large input",
              size=Xl,
              color=Primary,
            ),
          ]),
        ]),
      ]),

      // Input states
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Input States"),
        ]),
        div(class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4", [
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Normal State"),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Normal input",
              color=Primary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Error State"),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Error input",
              is_error=true,
              color=Primary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Success State"),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Success input",
              is_success=true,
              color=Primary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Disabled State"),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Disabled input",
              disabled=true,
              color=Primary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Pill Shape"),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Pill shaped input",
              is_pill=true,
              color=Primary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Current Value"),
            ]),
            @html.p(class="text-sm text-gray-500 mb-2", [
              text("Input value: \"{model.inputValue}\""),
            ]),
            @jade.input(
              model.inputValue,
              InputUpdate(_),
              placeholder="Type something...",
              color=Primary,
            ),
          ]),
        ]),
      ]),
    ]),
  ])
}

///| NOTE: This program is only available in the js backend, 
/// see README.md to getting started.
fn main {
  @theme.light().apply()
  let model = { count: 0, inputValue: "" }
  @tea.startup(model~, update~, view~)
}
