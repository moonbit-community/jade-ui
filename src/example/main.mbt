///|
enum Msg {
  Increment
  Decrement
  SliderUpdate(Int)
  ToggleAccordion(String)
  ToggleMenu(String)
  MenuItemClick(String) // (action, menuId) - performs action and closes menu
  SwitchToggle
}

///|
struct Model {
  count : Int
  openAccordions : Array[String]
  openMenus : Array[String]
  switch_checked : Bool
}

///|
fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match msg {
    Increment => (none(), { ..model, count: model.count + 1 })
    Decrement => (none(), { ..model, count: @cmp.maximum(0, model.count - 1) })
    SliderUpdate(value) => (none(), { ..model, count: value })
    ToggleAccordion(id) => {
      let newOpenAccordions = if model.openAccordions.contains(id) {
        model.openAccordions.filter(fn(item) { item != id })
      } else {
        let newArray = Array::new()
        for item in model.openAccordions {
          newArray.push(item)
        }
        newArray.push(id)
        newArray
      }
      (none(), { ..model, openAccordions: newOpenAccordions })
    }
    ToggleMenu(id) => {
      let newOpenMenus = Array::new()
      if !model.openMenus.contains(id) {
        newOpenMenus.push(id)
      }
      (none(), { ..model, openMenus: newOpenMenus })
    }
    MenuItemClick(menuId) => {
      // Handle menu item action and close the menu
      let newOpenMenus = model.openMenus.filter(fn(item) { item != menuId })
      (none(), { ..model, openMenus: newOpenMenus })
    }
    SwitchToggle => (none(), { ..model, switch_checked: !model.switch_checked })
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

    // Button Group showcase
    div(class="max-w-6xl mx-auto mb-12", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Button Group Component"),
      ]),

      // Horizontal Button Groups
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Horizontal Button Groups"),
        ]),
        div(class="space-y-4", [
          // Solid variant
          div([
            h4(class="text-md font-medium mb-2 text-gray-600", [
              text("Solid Variant"),
            ]),
            @jade.button_group(
              [
                @jade.button(
                  [text("First")],
                  Increment,
                  variant=@theme.Solid,
                  color=@theme.Primary,
                ),
                @jade.button(
                  [text("Second")],
                  Increment,
                  variant=@theme.Solid,
                  color=@theme.Primary,
                ),
                @jade.button(
                  [text("Third")],
                  Increment,
                  variant=@theme.Solid,
                  color=@theme.Primary,
                ),
              ],
              orientation=@theme.Horizontal,
            ),
          ]),
          // Outlined variant
          div([
            h4(class="text-md font-medium mb-2 text-gray-600", [
              text("Outlined Variant"),
            ]),
            @jade.button_group(
              [
                @jade.button(
                  [text("Left")],
                  Increment,
                  variant=@theme.Outlined,
                  color=@theme.Secondary,
                ),
                @jade.button(
                  [text("Center")],
                  Increment,
                  variant=@theme.Outlined,
                  color=@theme.Secondary,
                ),
                @jade.button(
                  [text("Right")],
                  Increment,
                  variant=@theme.Outlined,
                  color=@theme.Secondary,
                ),
              ],
              orientation=@theme.Horizontal,
            ),
          ]),
          // Ghost variant
          div([
            h4(class="text-md font-medium mb-2 text-gray-600", [
              text("Ghost Variant"),
            ]),
            @jade.button_group(
              [
                @jade.button(
                  [text("Option A")],
                  Increment,
                  variant=@theme.Ghost,
                  color=@theme.Info,
                ),
                @jade.button(
                  [text("Option B")],
                  Increment,
                  variant=@theme.Ghost,
                  color=@theme.Info,
                ),
                @jade.button(
                  [text("Option C")],
                  Increment,
                  variant=@theme.Ghost,
                  color=@theme.Info,
                ),
              ],
              orientation=@theme.Horizontal,
            ),
          ]),
        ]),
      ]),

      // Vertical Button Groups
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Vertical Button Groups"),
        ]),
        div(class="flex gap-8", [
          div([
            h4(class="text-md font-medium mb-2 text-gray-600", [
              text("Solid Vertical"),
            ]),
            @jade.button_group(
              [
                @jade.button(
                  [text("Top")],
                  Increment,
                  variant=@theme.Solid,
                  color=@theme.Success,
                ),
                @jade.button(
                  [text("Middle")],
                  Increment,
                  variant=@theme.Solid,
                  color=@theme.Success,
                ),
                @jade.button(
                  [text("Bottom")],
                  Increment,
                  variant=@theme.Solid,
                  color=@theme.Success,
                ),
              ],
              orientation=@theme.Vertical,
            ),
          ]),
          div([
            h4(class="text-md font-medium mb-2 text-gray-600", [
              text("Outlined Vertical"),
            ]),
            @jade.button_group(
              [
                @jade.button(
                  [text("First")],
                  Increment,
                  variant=@theme.Outlined,
                  color=@theme.Warning,
                ),
                @jade.button(
                  [text("Second")],
                  Increment,
                  variant=@theme.Outlined,
                  color=@theme.Warning,
                ),
                @jade.button(
                  [text("Third")],
                  Increment,
                  variant=@theme.Outlined,
                  color=@theme.Warning,
                ),
              ],
              orientation=@theme.Vertical,
            ),
          ]),
        ]),
      ]),

      // Button Group Sizes
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Button Group Sizes"),
        ]),
        div(class="space-y-4", [
          div([
            h4(class="text-md font-medium mb-2 text-gray-600", [
              text("Small Size"),
            ]),
            @jade.button_group([
              @jade.button(
                [text("Small")],
                Increment,
                variant=@theme.Solid,
                color=@theme.Primary,
                size=@theme.Sm,
              ),
              @jade.button(
                [text("Button")],
                Increment,
                variant=@theme.Solid,
                color=@theme.Primary,
                size=@theme.Sm,
              ),
              @jade.button(
                [text("Group")],
                Increment,
                variant=@theme.Solid,
                color=@theme.Primary,
                size=@theme.Sm,
              ),
            ]),
          ]),
          div([
            h4(class="text-md font-medium mb-2 text-gray-600", [
              text("Large Size"),
            ]),
            @jade.button_group([
              @jade.button(
                [text("Large")],
                Increment,
                variant=@theme.Solid,
                color=@theme.Primary,
                size=@theme.Lg,
              ),
              @jade.button(
                [text("Button")],
                Increment,
                variant=@theme.Solid,
                color=@theme.Primary,
                size=@theme.Lg,
              ),
              @jade.button(
                [text("Group")],
                Increment,
                variant=@theme.Solid,
                color=@theme.Primary,
                size=@theme.Lg,
              ),
            ]),
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

    // Accordion style showcase
    div(class="max-w-6xl mx-auto mb-12", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Accordion Component Styles"),
      ]),

      // Default accordion
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Default Accordion"),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          @jade.accordion([
            @jade.accordion_item(
              "faq1",
              @jade.accordion_trigger(
                [text("What is Jade UI?")],
                ToggleAccordion("faq1"),
                isOpen=model.openAccordions.contains("faq1"),
              ),
              @jade.accordion_content(
                [
                  text(
                    "Jade UI is a modern, customizable UI component library built with MoonBit. It provides a comprehensive set of components for building beautiful web applications.",
                  ),
                ],
                isOpen=model.openAccordions.contains("faq1"),
              ),
            ),
            @jade.accordion_item(
              "faq2",
              @jade.accordion_trigger(
                [text("How do I get started?")],
                ToggleAccordion("faq2"),
                isOpen=model.openAccordions.contains("faq2"),
              ),
              @jade.accordion_content(
                [
                  text(
                    "Getting started is easy! Simply install the package, import the components you need, and start building. Check out our documentation for detailed examples and API references.",
                  ),
                ],
                isOpen=model.openAccordions.contains("faq2"),
              ),
            ),
            @jade.accordion_item(
              "faq3",
              @jade.accordion_trigger(
                [text("Is it customizable?")],
                ToggleAccordion("faq3"),
                isOpen=model.openAccordions.contains("faq3"),
              ),
              @jade.accordion_content(
                [
                  text(
                    "Yes! Jade UI is highly customizable. You can customize colors, sizes, variants, and even add your own CSS classes to match your design system.",
                  ),
                ],
                isOpen=model.openAccordions.contains("faq3"),
              ),
            ),
          ]),
        ]),
      ]),

      // Bordered accordion
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Bordered Accordion"),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          @jade.accordion(
            [
              @jade.accordion_item(
                "bordered1",
                @jade.accordion_trigger(
                  [text("Features")],
                  ToggleAccordion("bordered1"),
                  isOpen=model.openAccordions.contains("bordered1"),
                  color=Primary,
                ),
                @jade.accordion_content(
                  [
                    text(
                      "Jade UI includes buttons, cards, sliders, typography, accordions, and many more components. All components are fully responsive and accessible.",
                    ),
                  ],
                  isOpen=model.openAccordions.contains("bordered1"),
                ),
                variant=Bordered,
              ),
              @jade.accordion_item(
                "bordered2",
                @jade.accordion_trigger(
                  [text("Performance")],
                  ToggleAccordion("bordered2"),
                  isOpen=model.openAccordions.contains("bordered2"),
                  color=Success,
                ),
                @jade.accordion_content(
                  [
                    text(
                      "Built with performance in mind, Jade UI components are lightweight and optimized for fast rendering. The library uses modern CSS techniques for smooth animations.",
                    ),
                  ],
                  isOpen=model.openAccordions.contains("bordered2"),
                ),
                variant=Bordered,
              ),
            ],
            variant=Bordered,
          ),
        ]),
      ]),

      // Split accordion
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Split Accordion"),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          @jade.accordion(
            [
              @jade.accordion_item(
                "split1",
                @jade.accordion_trigger(
                  [text("Documentation")],
                  ToggleAccordion("split1"),
                  isOpen=model.openAccordions.contains("split1"),
                  color=Info,
                ),
                @jade.accordion_content(
                  [
                    text(
                      "Comprehensive documentation with examples, API references, and best practices. Learn how to integrate Jade UI into your projects effectively.",
                    ),
                  ],
                  isOpen=model.openAccordions.contains("split1"),
                ),
                variant=Split,
              ),
              @jade.accordion_item(
                "split2",
                @jade.accordion_trigger(
                  [text("Community")],
                  ToggleAccordion("split2"),
                  isOpen=model.openAccordions.contains("split2"),
                  color=Warning,
                ),
                @jade.accordion_content(
                  [
                    text(
                      "Join our growing community of developers. Share your projects, get help, and contribute to making Jade UI even better.",
                    ),
                  ],
                  isOpen=model.openAccordions.contains("split2"),
                ),
                variant=Split,
              ),
            ],
            variant=Split,
          ),
        ]),
      ]),
    ]),

    // Menu style showcase
    div(class="max-w-6xl mx-auto mb-12", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Menu Component Styles"),
      ]),

      // Default menu
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Default Menu"),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          div(class="flex gap-4 flex-wrap", [
            @jade.menu([
              @jade.menu_trigger(
                [text("Options")],
                ToggleMenu("menu1"),
                isOpen=model.openMenus.contains("menu1"),
              ),
              @jade.menu_content(
                [
                  @jade.menu_item([text("Edit")], MenuItemClick("menu1")),
                  @jade.menu_item([text("Copy")], MenuItemClick("menu1")),
                  @jade.menu_separator(),
                  @jade.menu_item([text("Delete")], MenuItemClick("menu1")),
                ],
                isOpen=model.openMenus.contains("menu1"),
              ),
            ]),
            @jade.menu([
              @jade.menu_trigger(
                [text("Actions")],
                ToggleMenu("menu2"),
                isOpen=model.openMenus.contains("menu2"),
                color=Primary,
              ),
              @jade.menu_content(
                [
                  @jade.menu_item([text("Save")], MenuItemClick("menu2")),
                  @jade.menu_item([text("Export")], MenuItemClick("menu2")),
                  @jade.menu_separator(),
                  @jade.menu_item([text("Settings")], MenuItemClick("menu2")),
                ],
                isOpen=model.openMenus.contains("menu2"),
              ),
            ]),
          ]),
        ]),
      ]),

      // Bordered menu
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Bordered Menu"),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          div(class="flex gap-4 flex-wrap", [
            @jade.menu(
              [
                @jade.menu_trigger(
                  [text("File")],
                  ToggleMenu("menu3"),
                  isOpen=model.openMenus.contains("menu3"),
                  color=Success,
                ),
                @jade.menu_content(
                  [
                    @jade.menu_item([text("New File")], MenuItemClick("menu3")),
                    @jade.menu_item([text("Open")], MenuItemClick("menu3")),
                    @jade.menu_separator(),
                    @jade.menu_item([text("Save")], MenuItemClick("menu3")),
                    @jade.menu_item(
                      [text("Save As...")],
                      MenuItemClick("menu3"),
                    ),
                  ],
                  isOpen=model.openMenus.contains("menu3"),
                  variant=Bordered,
                ),
              ],
              variant=Bordered,
            ),
          ]),
        ]),
      ]),

      // Shadow menu
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Shadow Menu"),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          div(class="flex gap-4 flex-wrap", [
            @jade.menu(
              [
                @jade.menu_trigger(
                  [text("View")],
                  ToggleMenu("menu4"),
                  isOpen=model.openMenus.contains("menu4"),
                  color=Info,
                ),
                @jade.menu_content(
                  [
                    @jade.menu_item([text("Zoom In")], MenuItemClick("menu4")),
                    @jade.menu_item([text("Zoom Out")], MenuItemClick("menu4")),
                    @jade.menu_separator(),
                    @jade.menu_item(
                      [text("Full Screen")],
                      MenuItemClick("menu4"),
                    ),
                  ],
                  isOpen=model.openMenus.contains("menu4"),
                  variant=Shadow,
                ),
              ],
              variant=Shadow,
            ),
          ]),
        ]),
      ]),
    ]),
    // Switch Component showcase
    div(class="mb-12", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Switch Component"),
      ]),

      // Basic Switch
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Basic Switch"),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          div(class="flex items-center gap-4", [
            @jade.switch(
              checked=model.switch_checked,
              change=SwitchToggle,
              color=Primary,
            ),
            {
              let status = if model.switch_checked { "ON" } else { "OFF" }
              text("Switch is " + status)
            },
          ]),
        ]),
      ]),

      // Switch Colors
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Switch Colors"),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          div(class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4", [
            div(class="flex flex-col items-center gap-2", [
              @jade.switch(
                checked=model.switch_checked,
                change=SwitchToggle,
                color=Primary,
              ),
              text("Primary"),
            ]),
            div(class="flex flex-col items-center gap-2", [
              @jade.switch(
                checked=model.switch_checked,
                change=SwitchToggle,
                color=Secondary,
              ),
              text("Secondary"),
            ]),
            div(class="flex flex-col items-center gap-2", [
              @jade.switch(
                checked=model.switch_checked,
                change=SwitchToggle,
                color=Info,
              ),
              text("Info"),
            ]),
            div(class="flex flex-col items-center gap-2", [
              @jade.switch(
                checked=model.switch_checked,
                change=SwitchToggle,
                color=Success,
              ),
              text("Success"),
            ]),
            div(class="flex flex-col items-center gap-2", [
              @jade.switch(
                checked=model.switch_checked,
                change=SwitchToggle,
                color=Warning,
              ),
              text("Warning"),
            ]),
            div(class="flex flex-col items-center gap-2", [
              @jade.switch(
                checked=model.switch_checked,
                change=SwitchToggle,
                color=Error,
              ),
              text("Error"),
            ]),
          ]),
        ]),
      ]),

      // Chip component showcase
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Chip Component Styles"),
        ]),

        // Chip variants with all colors
        div(class="mb-6", [
          h4(class="text-md font-medium mb-3 text-gray-600", [
            text("Ghost Variant"),
          ]),
          div(class="flex flex-wrap gap-3", [
            @jade.chip(
              [@jade.chip_label([text("Primary")])],
              variant=Ghost,
              color=Primary,
            ),
            @jade.chip(
              [@jade.chip_label([text("Secondary")])],
              variant=Ghost,
              color=Secondary,
            ),
            @jade.chip(
              [@jade.chip_label([text("Info")])],
              variant=Ghost,
              color=Info,
            ),
            @jade.chip(
              [@jade.chip_label([text("Success")])],
              variant=Ghost,
              color=Success,
            ),
            @jade.chip(
              [@jade.chip_label([text("Warning")])],
              variant=Ghost,
              color=Warning,
            ),
            @jade.chip(
              [@jade.chip_label([text("Error")])],
              variant=Ghost,
              color=Error,
            ),
          ]),
        ]),
        div(class="mb-6", [
          h4(class="text-md font-medium mb-3 text-gray-600", [
            text("Solid Variant"),
          ]),
          div(class="flex flex-wrap gap-3", [
            @jade.chip(
              [@jade.chip_label([text("Primary")])],
              variant=Solid,
              color=Primary,
            ),
            @jade.chip(
              [@jade.chip_label([text("Secondary")])],
              variant=Solid,
              color=Secondary,
            ),
            @jade.chip(
              [@jade.chip_label([text("Info")])],
              variant=Solid,
              color=Info,
            ),
            @jade.chip(
              [@jade.chip_label([text("Success")])],
              variant=Solid,
              color=Success,
            ),
            @jade.chip(
              [@jade.chip_label([text("Warning")])],
              variant=Solid,
              color=Warning,
            ),
            @jade.chip(
              [@jade.chip_label([text("Error")])],
              variant=Solid,
              color=Error,
            ),
          ]),
        ]),
        div(class="mb-6", [
          h4(class="text-md font-medium mb-3 text-gray-600", [
            text("Outline Variant"),
          ]),
          div(class="flex flex-wrap gap-3", [
            @jade.chip(
              [@jade.chip_label([text("Primary")])],
              variant=Outline,
              color=Primary,
            ),
            @jade.chip(
              [@jade.chip_label([text("Secondary")])],
              variant=Outline,
              color=Secondary,
            ),
            @jade.chip(
              [@jade.chip_label([text("Info")])],
              variant=Outline,
              color=Info,
            ),
            @jade.chip(
              [@jade.chip_label([text("Success")])],
              variant=Outline,
              color=Success,
            ),
            @jade.chip(
              [@jade.chip_label([text("Warning")])],
              variant=Outline,
              color=Warning,
            ),
            @jade.chip(
              [@jade.chip_label([text("Error")])],
              variant=Outline,
              color=Error,
            ),
          ]),
        ]),
        div(class="mb-6", [
          h4(class="text-md font-medium mb-3 text-gray-600", [
            text("Gradient Variant"),
          ]),
          div(class="flex flex-wrap gap-3", [
            @jade.chip(
              [@jade.chip_label([text("Primary")])],
              variant=Gradient,
              color=Primary,
            ),
            @jade.chip(
              [@jade.chip_label([text("Secondary")])],
              variant=Gradient,
              color=Secondary,
            ),
            @jade.chip(
              [@jade.chip_label([text("Info")])],
              variant=Gradient,
              color=Info,
            ),
            @jade.chip(
              [@jade.chip_label([text("Success")])],
              variant=Gradient,
              color=Success,
            ),
            @jade.chip(
              [@jade.chip_label([text("Warning")])],
              variant=Gradient,
              color=Warning,
            ),
            @jade.chip(
              [@jade.chip_label([text("Error")])],
              variant=Gradient,
              color=Error,
            ),
          ]),
        ]),
      ]),

      // Chip sizes
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Chip Sizes"),
        ]),
        div(class="space-y-6", [
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Small (Sm)"),
            ]),
            div(class="flex flex-wrap gap-3", [
              @jade.chip(
                [@jade.chip_label([text("Small Chip")])],
                size=Sm,
                color=Primary,
              ),
              @jade.chip(
                [
                  @jade.chip_label([text("With Icon")]),
                  @jade.chip_dismiss_trigger(Increment),
                ],
                size=Sm,
                color=Success,
              ),
            ]),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Medium (Md)"),
            ]),
            div(class="flex flex-wrap gap-3", [
              @jade.chip(
                [@jade.chip_label([text("Medium Chip")])],
                size=Md,
                color=Primary,
              ),
              @jade.chip(
                [
                  @jade.chip_label([text("With Icon")]),
                  @jade.chip_dismiss_trigger(Increment),
                ],
                size=Md,
                color=Success,
              ),
            ]),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Large (Lg)"),
            ]),
            div(class="flex flex-wrap gap-3", [
              @jade.chip(
                [@jade.chip_label([text("Large Chip")])],
                size=Lg,
                color=Primary,
              ),
              @jade.chip(
                [
                  @jade.chip_label([text("With Icon")]),
                  @jade.chip_dismiss_trigger(Increment),
                ],
                size=Lg,
                color=Success,
              ),
            ]),
          ]),
        ]),
      ]),

      // Chip with different shapes
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Chip Shapes"),
        ]),
        div(class="space-y-6", [
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Pill Shape (Default)"),
            ]),
            div(class="flex flex-wrap gap-3", [
              @jade.chip(
                [@jade.chip_label([text("Pill Chip")])],
                isPill=true,
                color=Primary,
              ),
              @jade.chip(
                [
                  @jade.chip_label([text("Success")]),
                  @jade.chip_dismiss_trigger(Increment),
                ],
                isPill=true,
                color=Success,
              ),
            ]),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Rounded Shape"),
            ]),
            div(class="flex flex-wrap gap-3", [
              @jade.chip(
                [@jade.chip_label([text("Rounded Chip")])],
                isPill=false,
                color=Primary,
              ),
              @jade.chip(
                [
                  @jade.chip_label([text("Warning")]),
                  @jade.chip_dismiss_trigger(Increment),
                ],
                isPill=false,
                color=Warning,
              ),
            ]),
          ]),
        ]),
      ]),

      // Chip with icons and dismiss triggers
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Chip with Icons and Dismiss Triggers"),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          div(class="flex flex-wrap gap-3", [
            @jade.chip([@jade.chip_label([text("Simple Chip")])], color=Primary),
            @jade.chip(
              [
                @jade.chip_label([text("With Dismiss")]),
                @jade.chip_dismiss_trigger(Increment),
              ],
              color=Success,
            ),
            @jade.chip(
              [
                @jade.chip_label([text("Dismissible Info")]),
                @jade.chip_dismiss_trigger(Increment),
              ],
              color=Info,
              variant=Outline,
            ),
            @jade.chip(
              [
                @jade.chip_label([text("Warning Chip")]),
                @jade.chip_dismiss_trigger(Increment),
              ],
              color=Warning,
              variant=Ghost,
            ),
            @jade.chip(
              [
                @jade.chip_label([text("Error Chip")]),
                @jade.chip_dismiss_trigger(Increment),
              ],
              color=Error,
              variant=Gradient,
            ),
          ]),
        ]),
      ]),
    ]),
  ])
}

///|
/// NOTE: This program is only available in the js backend, 
/// see README.md to getting started.
fn main {
  @theme.light().apply()
  let model = {
    count: 0,
    openAccordions: [],
    openMenus: [],
    switch_checked: false,
  }
  @tea.startup(model~, update~, view~)
}
