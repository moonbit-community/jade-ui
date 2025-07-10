///|
enum Msg {
  Increment
  Decrement
}

///|
struct Model {
  count : Int
}

///|
fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match msg {
    Increment => (none(), { ..model, count: model.count + 1 })
    Decrement => (none(), { ..model, count: @cmp.maximum(0, model.count - 1) })
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

      // Typography in combination
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Typography Combinations"),
        ]),
        div(class="grid grid-cols-1 md:grid-cols-2 gap-6", [
          @jade.card(
            [
              @jade.card_header([
                @jade.typography(tag=H4, color=Primary, [text("Article Header")]),
              ]),
              @jade.card_body([
                div(class="space-y-3", [
                  @jade.typography(tag=Lead, color=Default, [
                    text(
                      "This is an introductory paragraph that captures the reader's attention and provides an overview of what's to come.",
                    ),
                  ]),
                  @jade.typography(tag=P, color=Default, [
                    text(
                      "This is the main content paragraph with detailed information. It demonstrates how typography components work together to create a cohesive reading experience.",
                    ),
                  ]),
                  @jade.typography(tag=Small, color=Secondary, [
                    text(
                      "Published on March 15, 2024 | Reading time: 3 minutes",
                    ),
                  ]),
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
            ],
            variant=Outline,
            color=Default,
          ),
          @jade.card(
            [
              @jade.card_header([
                @jade.typography(tag=H4, color=Error, [text("Alert Message")]),
              ]),
              @jade.card_body([
                div(class="space-y-3", [
                  @jade.typography(tag=P, color=Error, [
                    text(
                      "This is an important alert message that requires immediate attention. The typography color helps convey the urgency.",
                    ),
                  ]),
                  @jade.typography(tag=Small, color=Warning, [
                    text(
                      "Please review this information carefully before proceeding.",
                    ),
                  ]),
                ]),
              ]),
              @jade.card_footer([
                div(class="flex gap-2", [
                  @jade.button(
                    [text("Acknowledge")],
                    Increment,
                    variant=Solid,
                    color=Error,
                    size=Sm,
                  ),
                  @jade.button(
                    [text("Dismiss")],
                    Decrement,
                    variant=Ghost,
                    color=Error,
                    size=Sm,
                  ),
                ]),
              ]),
            ],
            variant=Outline,
            color=Error,
          ),
        ]),
      ]),

      // Typography with custom classes
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Typography with Custom Styling"),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm space-y-4", [
          @jade.typography(
            tag=H2,
            color=Primary,
            class="text-center border-b border-gray-200 pb-4",
            [text("Centered Heading with Border")],
          ),
          @jade.typography(
            tag=P,
            color=Default,
            class="text-justify leading-relaxed",
            [
              text(
                "This paragraph demonstrates how you can combine the typography component with custom classes to achieve specific styling effects. The component provides the base typography styles while allowing you to add your own customizations.",
              ),
            ],
          ),
          @jade.typography(
            tag=Small,
            color=Secondary,
            class="italic text-right",
            [text("— Styled with custom classes")],
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
  let model = { count: 0 }
  @tea.startup(model~, update~, view~)
}
