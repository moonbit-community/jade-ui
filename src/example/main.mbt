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
  RadioSelect(String)
  SliderUpdate(Int)
  ToggleAccordion(String)
  ToggleMenu(String)
  MenuItemClick(String) // (action, menuId) - performs action and closes menu
  SwitchToggle
  TabChange(String)
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
  selectedRadio : String
  openAccordions : Array[String]
  openMenus : Array[String]
  switch_checked : Bool
  activeTab : String
}

///|
fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match msg {
    Increment => (none(), { ..model, count: model.count + 1 })
    Decrement => (none(), { ..model, count: @cmp.maximum(0, model.count - 1) })
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
    RadioSelect(value) => (none(), { ..model, selectedRadio: value })
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
    TabChange(tab) => (none(), { ..model, activeTab: tab })
  }
}

///|
fn view(model : Model) -> Html[Msg] {
  div(class="w-full min-h-screen p-8 bg-gray-50", [
    // Title
    h1(class="text-3xl font-bold text-center mb-8 text-gray-800", [
      text("Jade UI Component Style Showcase"),
    ]),

    // Navbar Component Showcase
    div(class="max-w-6xl mx-auto mb-12", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Navbar Component"),
      ]),

      // Style Navbar Example
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Jade UI Style Navbar"),
        ]),
        @jade.navbar(
          [
            div(class="flex items-center justify-between w-full", [
              // Brand section
              div(class="flex items-center", [
                @jade.typography(tag=H6, color=Default, class="font-semibold", [
                  text("Jade UI"),
                ]),
                div(class="ml-4 mr-4 hidden h-5 w-px bg-gray-300 lg:block", []),
                // Navigation links (hidden on mobile)
                div(class="hidden lg:flex lg:items-center lg:gap-6", [
                  @jade.typography(
                    tag=Small,
                    color=Default,
                    class="flex items-center gap-2 hover:text-blue-600 cursor-pointer",
                    [text("📄 Pages")],
                  ),
                  @jade.typography(
                    tag=Small,
                    color=Default,
                    class="flex items-center gap-2 hover:text-blue-600 cursor-pointer",
                    [text("👤 Account")],
                  ),
                  @jade.typography(
                    tag=Small,
                    color=Default,
                    class="flex items-center gap-2 hover:text-blue-600 cursor-pointer",
                    [text("🧩 Blocks")],
                  ),
                  @jade.typography(
                    tag=Small,
                    color=Default,
                    class="flex items-center gap-2 hover:text-blue-600 cursor-pointer",
                    [text("📚 Docs")],
                  ),
                ]),
              ]),
              // Action buttons
              div(class="flex items-center gap-2", [
                @jade.button(
                  [text("Sign In")],
                  Increment,
                  variant=Solid,
                  color=Primary,
                  size=Sm,
                  class="hidden lg:inline-flex",
                ),
                @jade.button(
                  [text("☰")],
                  Increment,
                  variant=Ghost,
                  color=Secondary,
                  size=Sm,
                  class="lg:hidden",
                ),
              ]),
            ]),
          ],
          variant=Solid,
          color=Default,
          shadow=true,
          class=Some("mx-auto max-w-screen-xl"),
        ),
      ]),

      // Navbar variants
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Navbar Variants"),
        ]),
        div(class="space-y-4", [
          // Ghost variant
          @jade.navbar(
            [
              div(class="flex items-center", [
                h3(class="text-lg font-semibold", [text("Ghost Navbar")]),
              ]),
              div(class="flex items-center gap-4", [
                @jade.button(
                  [text("Home")],
                  Increment,
                  variant=Ghost,
                  color=Primary,
                  size=Sm,
                ),
                @jade.button(
                  [text("About")],
                  Increment,
                  variant=Ghost,
                  color=Primary,
                  size=Sm,
                ),
                @jade.button(
                  [text("Contact")],
                  Increment,
                  variant=Ghost,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Ghost,
            color=Default,
          ),

          // Solid variant
          @jade.navbar(
            [
              div(class="flex items-center", [
                h3(class="text-lg font-semibold", [text("Solid Navbar")]),
              ]),
              div(class="flex items-center gap-4", [
                @jade.button(
                  [text("Home")],
                  Increment,
                  variant=Outlined,
                  color=Primary,
                  size=Sm,
                ),
                @jade.button(
                  [text("About")],
                  Increment,
                  variant=Outlined,
                  color=Primary,
                  size=Sm,
                ),
                @jade.button(
                  [text("Contact")],
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

          // Outline variant
          @jade.navbar(
            [
              div(class="flex items-center", [
                h3(class="text-lg font-semibold", [text("Outline Navbar")]),
              ]),
              div(class="flex items-center gap-4", [
                @jade.button(
                  [text("Home")],
                  Increment,
                  variant=Ghost,
                  color=Primary,
                  size=Sm,
                ),
                @jade.button(
                  [text("About")],
                  Increment,
                  variant=Ghost,
                  color=Primary,
                  size=Sm,
                ),
                @jade.button(
                  [text("Contact")],
                  Increment,
                  variant=Solid,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Outline,
            color=Primary,
          ),

          // Gradient variant
          @jade.navbar(
            [
              div(class="flex items-center", [
                h3(class="text-lg font-semibold text-white", [
                  text("Gradient Navbar"),
                ]),
              ]),
              div(class="flex items-center gap-4", [
                @jade.button(
                  [text("Home")],
                  Increment,
                  variant=Ghost,
                  color=Primary,
                  size=Sm,
                ),
                @jade.button(
                  [text("About")],
                  Increment,
                  variant=Ghost,
                  color=Primary,
                  size=Sm,
                ),
                @jade.button(
                  [text("Contact")],
                  Increment,
                  variant=Solid,
                  color=Secondary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Gradient,
            color=Primary,
          ),
        ]),
      ]),

      // Navbar colors
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Navbar Colors (Solid Variant)"),
        ]),
        div(class="space-y-4", [
          @jade.navbar(
            [
              div(class="flex items-center", [
                h4(class="font-semibold", [text("Primary Color")]),
              ]),
              div(class="flex items-center gap-2", [
                @jade.button(
                  [text("Action")],
                  Increment,
                  variant=Outlined,
                  color=Secondary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Solid,
            color=Primary,
          ),
          @jade.navbar(
            [
              div(class="flex items-center", [
                h4(class="font-semibold", [text("Success Color")]),
              ]),
              div(class="flex items-center gap-2", [
                @jade.button(
                  [text("Action")],
                  Increment,
                  variant=Outlined,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Solid,
            color=Success,
          ),
          @jade.navbar(
            [
              div(class="flex items-center", [
                h4(class="font-semibold", [text("Warning Color")]),
              ]),
              div(class="flex items-center gap-2", [
                @jade.button(
                  [text("Action")],
                  Increment,
                  variant=Outlined,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Solid,
            color=Warning,
          ),
          @jade.navbar(
            [
              div(class="flex items-center", [
                h4(class="font-semibold", [text("Error Color")]),
              ]),
              div(class="flex items-center gap-2", [
                @jade.button(
                  [text("Action")],
                  Increment,
                  variant=Outlined,
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

      // Navbar features
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Navbar Features"),
        ]),
        div(class="space-y-4", [
          // With shadow
          @jade.navbar(
            [
              div(class="flex items-center", [
                h4(class="font-semibold", [text("With Shadow")]),
              ]),
              div(class="flex items-center gap-2", [
                @jade.button(
                  [text("Menu")],
                  Increment,
                  variant=Ghost,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Solid,
            color=Default,
            shadow=true,
          ),

          // Without shadow
          @jade.navbar(
            [
              div(class="flex items-center", [
                h4(class="font-semibold", [text("Without Shadow")]),
              ]),
              div(class="flex items-center gap-2", [
                @jade.button(
                  [text("Menu")],
                  Increment,
                  variant=Ghost,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Solid,
            color=Default,
            shadow=false,
          ),

          // Blurred background
          @jade.navbar(
            [
              div(class="flex items-center", [
                h4(class="font-semibold", [text("Blurred Background")]),
              ]),
              div(class="flex items-center gap-2", [
                @jade.button(
                  [text("Menu")],
                  Increment,
                  variant=Ghost,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Ghost,
            color=Default,
            blurred=true,
          ),

          // Full width
          @jade.navbar(
            [
              div(class="flex items-center", [
                h4(class="font-semibold", [
                  text("Full Width (No Border Radius)"),
                ]),
              ]),
              div(class="flex items-center gap-2", [
                @jade.button(
                  [text("Menu")],
                  Increment,
                  variant=Ghost,
                  color=Primary,
                  size=Sm,
                ),
              ]),
            ],
            variant=Solid,
            color=Default,
            fullWidth=true,
          ),
        ]),
      ]),
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
            label="Primary color checkbox",
            color=Primary,
          ),
          @jade.checkbox(
            model.checkbox2,
            ToggleCheckbox2,
            id="secondary-checkbox",
            label="Secondary color checkbox",
            color=Secondary,
          ),
          @jade.checkbox(
            model.checkbox3,
            ToggleCheckbox3,
            id="info-checkbox",
            label="Info color checkbox",
            color=Info,
          ),
          @jade.checkbox(
            model.checkbox4,
            ToggleCheckbox4,
            id="success-checkbox",
            label="Success color checkbox",
            color=Success,
          ),
          @jade.checkbox(
            model.checkbox5,
            ToggleCheckbox5,
            id="warning-checkbox",
            label="Warning color checkbox",
            color=Warning,
          ),
          @jade.checkbox(
            model.checkbox6,
            ToggleCheckbox6,
            id="error-checkbox",
            label="Error color checkbox",
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
            label="Small checkbox",
            size=Sm,
            color=Primary,
          ),
          @jade.checkbox(
            model.checkbox2,
            ToggleCheckbox2,
            id="medium-checkbox",
            label="Medium checkbox",
            size=Md,
            color=Primary,
          ),
          @jade.checkbox(
            model.checkbox3,
            ToggleCheckbox3,
            id="large-checkbox",
            label="Large checkbox",
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
              label="Disabled checked",
              color=Primary,
              disabled=true,
            ),
            @jade.checkbox(
              false,
              ToggleCheckbox2,
              label="Disabled unchecked",
              color=Success,
              disabled=true,
            ),
          ]),
        ]),
      ]),
    ]),

    // Radio style showcase
    div(class="max-w-6xl mx-auto mb-12", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Radio Component Styles"),
      ]),

      // Radio colors
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Radio Colors"),
        ]),
        div(class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6", [
          @jade.radio(
            model.selectedRadio == "primary",
            RadioSelect("primary"),
            id="primary-radio",
            name="color-demo",
            value="primary",
            label="Primary color radio",
            color=Primary,
          ),
          @jade.radio(
            model.selectedRadio == "secondary",
            RadioSelect("secondary"),
            id="secondary-radio",
            name="color-demo",
            value="secondary",
            label="Secondary color radio",
            color=Secondary,
          ),
          @jade.radio(
            model.selectedRadio == "info",
            RadioSelect("info"),
            id="info-radio",
            name="color-demo",
            value="info",
            label="Info color radio",
            color=Info,
          ),
          @jade.radio(
            model.selectedRadio == "success",
            RadioSelect("success"),
            id="success-radio",
            name="color-demo",
            value="success",
            label="Success color radio",
            color=Success,
          ),
          @jade.radio(
            model.selectedRadio == "warning",
            RadioSelect("warning"),
            id="warning-radio",
            name="color-demo",
            value="warning",
            label="Warning color radio",
            color=Warning,
          ),
          @jade.radio(
            model.selectedRadio == "error",
            RadioSelect("error"),
            id="error-radio",
            name="color-demo",
            value="error",
            label="Error color radio",
            color=Error,
          ),
        ]),
      ]),

      // Radio sizes
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Radio Sizes"),
        ]),
        div(class="flex items-center gap-6 flex-wrap", [
          @jade.radio(
            model.selectedRadio == "small",
            RadioSelect("small"),
            id="small-radio",
            name="size-demo",
            value="small",
            label="Small radio",
            size=Sm,
            color=Primary,
          ),
          @jade.radio(
            model.selectedRadio == "medium",
            RadioSelect("medium"),
            id="medium-radio",
            name="size-demo",
            value="medium",
            label="Medium radio",
            size=Md,
            color=Primary,
          ),
          @jade.radio(
            model.selectedRadio == "large",
            RadioSelect("large"),
            id="large-radio",
            name="size-demo",
            value="large",
            label="Large radio",
            size=Lg,
            color=Primary,
          ),
        ]),
      ]),

      // Radio states
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Radio States"),
        ]),
        div(class="grid grid-cols-1 md:grid-cols-2 gap-6", [
          div(class="space-y-4", [
            h4(class="text-md font-medium text-gray-600", [
              text("Disabled Radios"),
            ]),
            @jade.radio(
              true,
              RadioSelect("disabled-checked"),
              name="disabled-demo",
              value="disabled-checked",
              label="Disabled checked",
              color=Primary,
              disabled=true,
            ),
            @jade.radio(
              false,
              RadioSelect("disabled-unchecked"),
              name="disabled-demo",
              value="disabled-unchecked",
              label="Disabled unchecked",
              color=Success,
              disabled=true,
            ),
          ]),
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
            @jade.typography(
              tag=H6,
              class="text-md font-medium mb-2 text-gray-600",
              [text("Solid Variant")],
            ),
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
            @jade.typography(
              tag=H6,
              class="text-md font-medium mb-2 text-gray-600",
              [text("Ghost Variant")],
            ),
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
        @jade.typography(
          tag=H6,
          class="text-lg font-semibold mb-4 text-gray-700",
          [text("Vertical Button Groups")],
        ),
        div(class="flex gap-8", [
          div([
            @jade.typography(
              tag=H6,
              class="text-md font-medium mb-2 text-gray-600",
              [text("Solid Vertical")],
            ),
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
        @jade.typography(
          tag=H6,
          class="text-lg font-semibold mb-4 text-gray-700",
          [text("Button Group Sizes")],
        ),
        div(class="space-y-4", [
          div([
            @jade.typography(
              tag=H6,
              class="text-md font-medium mb-2 text-gray-600",
              [text("Small Size")],
            ),
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
            @jade.typography(
              tag=H6,
              class="text-md font-medium mb-2 text-gray-600",
              [text("Large Size")],
            ),
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
          full_width=true,
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

    // Breadcrumb style showcase
    div(class="max-w-6xl mx-auto mb-12", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Breadcrumb Component Styles"),
      ]),

      // Breadcrumb variants
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Breadcrumb Variants"),
        ]),
        div(class="space-y-6", [
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Default Variant"),
            ]),
            @jade.breadcrumb(
              [
                { text: "Home", href: Some("/"), click: None, isActive: false },
                {
                  text: "Products",
                  href: Some("/products"),
                  click: None,
                  isActive: false,
                },
                {
                  text: "Electronics",
                  href: Some("/products/electronics"),
                  click: None,
                  isActive: false,
                },
                { text: "Smartphones", href: None, click: None, isActive: true },
              ],
              variant=Default,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Bordered Variant"),
            ]),
            @jade.breadcrumb(
              [
                {
                  text: "Dashboard",
                  href: Some("/dashboard"),
                  click: None,
                  isActive: false,
                },
                {
                  text: "Analytics",
                  href: Some("/analytics"),
                  click: None,
                  isActive: false,
                },
                { text: "Reports", href: None, click: None, isActive: true },
              ],
              variant=Bordered,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Underlined Variant"),
            ]),
            @jade.breadcrumb(
              [
                {
                  text: "Settings",
                  href: Some("/settings"),
                  click: None,
                  isActive: false,
                },
                {
                  text: "Profile",
                  href: Some("/settings/profile"),
                  click: None,
                  isActive: false,
                },
                { text: "Security", href: None, click: None, isActive: true },
              ],
              variant=Underlined,
            ),
          ]),
        ]),
      ]),

      // Breadcrumb colors
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Breadcrumb Colors"),
        ]),
        div(class="grid grid-cols-1 md:grid-cols-2 gap-6", [
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Primary Color"),
            ]),
            @jade.breadcrumb(
              [
                { text: "Home", href: Some("/"), click: None, isActive: false },
                {
                  text: "Library",
                  href: Some("/library"),
                  click: None,
                  isActive: false,
                },
                { text: "Data", href: None, click: None, isActive: true },
              ],
              color=Primary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Secondary Color"),
            ]),
            @jade.breadcrumb(
              [
                { text: "Home", href: Some("/"), click: None, isActive: false },
                {
                  text: "Library",
                  href: Some("/library"),
                  click: None,
                  isActive: false,
                },
                { text: "Data", href: None, click: None, isActive: true },
              ],
              color=Secondary,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Success Color"),
            ]),
            @jade.breadcrumb(
              [
                { text: "Home", href: Some("/"), click: None, isActive: false },
                {
                  text: "Library",
                  href: Some("/library"),
                  click: None,
                  isActive: false,
                },
                { text: "Data", href: None, click: None, isActive: true },
              ],
              color=Success,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Error Color"),
            ]),
            @jade.breadcrumb(
              [
                { text: "Home", href: Some("/"), click: None, isActive: false },
                {
                  text: "Library",
                  href: Some("/library"),
                  click: None,
                  isActive: false,
                },
                { text: "Data", href: None, click: None, isActive: true },
              ],
              color=Error,
            ),
          ]),
        ]),
      ]),

      // Breadcrumb sizes
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Breadcrumb Sizes"),
        ]),
        div(class="space-y-6", [
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Small Size"),
            ]),
            @jade.breadcrumb(
              [
                { text: "Home", href: Some("/"), click: None, isActive: false },
                {
                  text: "Docs",
                  href: Some("/docs"),
                  click: None,
                  isActive: false,
                },
                { text: "API", href: None, click: None, isActive: true },
              ],
              size=Sm,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Medium Size"),
            ]),
            @jade.breadcrumb(
              [
                { text: "Home", href: Some("/"), click: None, isActive: false },
                {
                  text: "Docs",
                  href: Some("/docs"),
                  click: None,
                  isActive: false,
                },
                { text: "API", href: None, click: None, isActive: true },
              ],
              size=Md,
            ),
          ]),
          div(class="bg-white rounded-lg p-6 shadow-sm", [
            h4(class="text-md font-medium mb-3 text-gray-600", [
              text("Large Size"),
            ]),
            @jade.breadcrumb(
              [
                { text: "Home", href: Some("/"), click: None, isActive: false },
                {
                  text: "Docs",
                  href: Some("/docs"),
                  click: None,
                  isActive: false,
                },
                { text: "API", href: None, click: None, isActive: true },
              ],
              size=Lg,
            ),
          ]),
        ]),
      ]),

      // Simple breadcrumb
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Simple Breadcrumb"),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          h4(class="text-md font-medium mb-3 text-gray-600", [
            text("Auto-generated from strings"),
          ]),
          @jade.breadcrumb_simple([
            "Home", "Products", "Electronics", "Smartphones",
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
                is_open=model.openAccordions.contains("faq1"),
              ),
              @jade.accordion_content(
                [
                  text(
                    "Jade UI is a modern, customizable UI component library built with MoonBit. It provides a comprehensive set of components for building beautiful web applications.",
                  ),
                ],
                is_open=model.openAccordions.contains("faq1"),
              ),
            ),
            @jade.accordion_item(
              "faq2",
              @jade.accordion_trigger(
                [text("How do I get started?")],
                ToggleAccordion("faq2"),
                is_open=model.openAccordions.contains("faq2"),
              ),
              @jade.accordion_content(
                [
                  text(
                    "Getting started is easy! Simply install the package, import the components you need, and start building. Check out our documentation for detailed examples and API references.",
                  ),
                ],
                is_open=model.openAccordions.contains("faq2"),
              ),
            ),
            @jade.accordion_item(
              "faq3",
              @jade.accordion_trigger(
                [text("Is it customizable?")],
                ToggleAccordion("faq3"),
                is_open=model.openAccordions.contains("faq3"),
              ),
              @jade.accordion_content(
                [
                  text(
                    "Yes! Jade UI is highly customizable. You can customize colors, sizes, variants, and even add your own CSS classes to match your design system.",
                  ),
                ],
                is_open=model.openAccordions.contains("faq3"),
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
                  is_open=model.openAccordions.contains("bordered1"),
                  color=Primary,
                ),
                @jade.accordion_content(
                  [
                    text(
                      "Jade UI includes buttons, cards, sliders, typography, accordions, and many more components. All components are fully responsive and accessible.",
                    ),
                  ],
                  is_open=model.openAccordions.contains("bordered1"),
                ),
                variant=Bordered,
              ),
              @jade.accordion_item(
                "bordered2",
                @jade.accordion_trigger(
                  [text("Performance")],
                  ToggleAccordion("bordered2"),
                  is_open=model.openAccordions.contains("bordered2"),
                  color=Success,
                ),
                @jade.accordion_content(
                  [
                    text(
                      "Built with performance in mind, Jade UI components are lightweight and optimized for fast rendering. The library uses modern CSS techniques for smooth animations.",
                    ),
                  ],
                  is_open=model.openAccordions.contains("bordered2"),
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
                  is_open=model.openAccordions.contains("split1"),
                  color=Info,
                ),
                @jade.accordion_content(
                  [
                    text(
                      "Comprehensive documentation with examples, API references, and best practices. Learn how to integrate Jade UI into your projects effectively.",
                    ),
                  ],
                  is_open=model.openAccordions.contains("split1"),
                ),
                variant=Split,
              ),
              @jade.accordion_item(
                "split2",
                @jade.accordion_trigger(
                  [text("Community")],
                  ToggleAccordion("split2"),
                  is_open=model.openAccordions.contains("split2"),
                  color=Warning,
                ),
                @jade.accordion_content(
                  [
                    text(
                      "Join our growing community of developers. Share your projects, get help, and contribute to making Jade UI even better.",
                    ),
                  ],
                  is_open=model.openAccordions.contains("split2"),
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
    ]),

    // Popover component showcase
    div(class="mb-8", [
      h3(class="text-lg font-semibold mb-4 text-gray-700", [
        text("Popover Component Styles"),
      ]),

      // Popover placements
      div(class="mb-6", [
        h4(class="text-md font-medium mb-3 text-gray-600", [
          text("Popover Placements"),
        ]),
        div(class="grid grid-cols-2 md:grid-cols-4 gap-4", [
          @jade.popover(
            content="Click me (Top)",
            children=text(
              "This is a top-positioned popover with helpful information.",
            ),
            placement=@theme.Top,
          ),
          @jade.popover(
            content="Click me (Bottom)",
            children=text(
              "This is a bottom-positioned popover with helpful information.",
            ),
            placement=@theme.Bottom,
          ),
          @jade.popover(
            content="Click me (Left)",
            children=text(
              "This is a left-positioned popover with helpful information.",
            ),
            placement=@theme.Left,
          ),
          @jade.popover(
            content="Click me (Right)",
            children=text(
              "This is a right-positioned popover with helpful information.",
            ),
            placement=@theme.Right,
          ),
        ]),
      ]),

      // Popover sizes
      div(class="mb-6", [
        h4(class="text-md font-medium mb-3 text-gray-600", [
          text("Popover Sizes"),
        ]),
        div(class="flex gap-4 flex-wrap", [
          @jade.popover(
            content="Small Popover",
            children=text("This is a small popover."),
            size=@theme.Sm,
          ),
          @jade.popover(
            content="Medium Popover",
            children=text("This is a medium popover with more content."),
            size=@theme.Md,
          ),
          @jade.popover(
            content="Large Popover",
            children=text(
              "This is a large popover with even more content and space for detailed information.",
            ),
            size=@theme.Lg,
          ),
        ]),
      ]),

      // Popover colors
      div(class="mb-6", [
        h4(class="text-md font-medium mb-3 text-gray-600", [
          text("Popover Colors"),
        ]),
        div(class="grid grid-cols-2 md:grid-cols-3 gap-4", [
          @jade.popover(
            content="Primary",
            children=text("Primary colored popover"),
            color=@theme.Primary,
          ),
          @jade.popover(
            content="Secondary",
            children=text("Secondary colored popover"),
            color=@theme.Secondary,
          ),
          @jade.popover(
            content="Info",
            children=text("Info colored popover"),
            color=@theme.Info,
          ),
          @jade.popover(
            content="Success",
            children=text("Success colored popover"),
            color=@theme.Success,
          ),
          @jade.popover(
            content="Warning",
            children=text("Warning colored popover"),
            color=@theme.Warning,
          ),
          @jade.popover(
            content="Error",
            children=text("Error colored popover"),
            color=@theme.Error,
          ),
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
      h3(class="text-lg font-semibold mb-4 text-gray-700", [text("Chip Sizes")]),
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
    render_avatar_section(model),
    render_alert_section(model),
    render_tabs_section(model),
  ])
}

///|
/// 标签页展示区域
fn render_tabs_section(model : Model) -> Html[Msg] {
  let tabs = ["Tab1", "Tab2", "Tab3"]
  let variants : Array[@theme.TabsVariant] = [Default, Pills, Underline]
  @html.div([
    @jade.card(
      [
        @jade.card_header([
          @jade.typography(tag=H2, color=Default, [
            text("Tabs Component Styles"),
          ]),
        ]),
        @jade.card_body(
          [
            @jade.typography(tag=H3, color=Default, class="mb-4", [
              text("Tab Variants"),
            ]),
            ..variants.map(variant => div(class="space-y-8", [
              // Default 变体
              @jade.card(
                [
                  @jade.card_body([
                    @jade.tabs(
                      [
                        @jade.tabs_list(
                          variant~,
                          tabs.map(tab => @jade.tabs_trigger(
                            [text(tab)],
                            TabChange(tab),
                            is_active=model.activeTab == tab,
                            variant~,
                          )),
                        ),
                        ..tabs.map(tab => @jade.tabs_panel(
                          [text("\{tab} content here")],
                          is_active=model.activeTab == tab,
                        )),
                      ],
                    ),
                  ]),
                ],
                variant=Ghost,
                color=@theme.Default,
              ),
            ])),
          ],
        ),
      ],
      variant=@theme.Solid,
      color=@theme.Default,
    ),

    // Badge component showcase
    div(class="max-w-6xl mx-auto mb-12", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Badge Component Styles"),
      ]),

      // Badge variants
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Badge Variants"),
        ]),
        div(class="flex flex-wrap gap-4", [
          @jade.badge(
            [@jade.button([text("Messages")], Increment, size=@theme.Lg)],
            content="5",
            variant=@theme.Solid,
            color=@theme.Error,
            placement=@theme.TopEnd,
          ),
          @jade.badge(
            [@jade.button([text("Notifications")], Increment, size=@theme.Lg)],
            content="99+",
            variant=@theme.Ghost,
            color=@theme.Primary,
            placement=@theme.TopEnd,
          ),
          @jade.badge(
            [@jade.button([text("Updates")], Increment, size=@theme.Lg)],
            variant=@theme.Outline,
            color=@theme.Success,
            placement=@theme.TopEnd,
          ),
          @jade.badge(
            [@jade.button([text("Premium")], Increment, size=@theme.Lg)],
            content="New",
            variant=@theme.Gradient,
            color=@theme.Warning,
            placement=@theme.TopEnd,
          ),
        ]),
      ]),

      // Badge placements
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Badge Placements"),
        ]),
        div(class="flex flex-wrap gap-4", [
          @jade.badge(
            [div(class="w-12 h-12 bg-gray-200 rounded-lg", [])],
            content="1",
            placement=@theme.TopStart,
            color=@theme.Error,
          ),
          @jade.badge(
            [div(class="w-12 h-12 bg-gray-200 rounded-lg", [])],
            content="2",
            placement=@theme.TopEnd,
            color=@theme.Success,
          ),
          @jade.badge(
            [div(class="w-12 h-12 bg-gray-200 rounded-lg", [])],
            content="3",
            placement=@theme.BottomStart,
            color=@theme.Warning,
          ),
          @jade.badge(
            [div(class="w-12 h-12 bg-gray-200 rounded-lg", [])],
            content="4",
            placement=@theme.BottomEnd,
            color=@theme.Info,
          ),
        ]),
      ]),

      // Badge sizes and colors
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Badge Sizes and Colors"),
        ]),
        div(class="flex flex-wrap gap-4", [
          @jade.badge(
            [@jade.button([text("Small")], Increment)],
            content="S",
            size=@theme.Sm,
            color=@theme.Primary,
          ),
          @jade.badge(
            [@jade.button([text("Medium")], Increment)],
            content="M",
            size=@theme.Md,
            color=@theme.Secondary,
          ),
          @jade.badge(
            [@jade.button([text("Large")], Increment)],
            content="L",
            size=@theme.Lg,
            color=@theme.Info,
          ),
          @jade.badge(
            [@jade.button([text("Success")], Increment)],
            content="✓",
            color=@theme.Success,
          ),
          @jade.badge(
            [@jade.button([text("Warning")], Increment)],
            content="!",
            color=@theme.Warning,
          ),
          @jade.badge(
            [@jade.button([text("Error")], Increment)],
            content="×",
            color=@theme.Error,
          ),
        ]),
      ]),

      // Badge indicators only
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Badge Indicators"),
        ]),
        div(class="flex flex-wrap gap-4 items-center", [
          @jade.badge_indicator(
            content=Some("1"),
            variant=@theme.Solid,
            color=@theme.Primary,
          ),
          @jade.badge_indicator(
            content=Some("99+"),
            variant=@theme.Ghost,
            color=@theme.Secondary,
          ),
          @jade.badge_indicator(
            content=Some("New"),
            variant=@theme.Outline,
            color=@theme.Success,
          ),
          @jade.badge_indicator(
            content=Some("Hot"),
            variant=@theme.Gradient,
            color=@theme.Error,
          ),
          @jade.badge_indicator(variant=@theme.Solid, color=@theme.Warning),
        ]),
      ]),
    ]),
    // Chip with different shapes
    div(class="mb-8", [
      h3(class="text-lg font-semibold mb-4 text-gray-700", [text("Chip Shapes")]),
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
    // Spinner component showcase
    div(class="mb-8", [
      h3(class="text-lg font-semibold mb-4 text-gray-700", [
        text("Spinner Component"),
      ]),

      // Spinner colors
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Spinner Colors"),
        ]),
        div(class="flex flex-wrap gap-4", [
          @jade.spinner(color=Primary),
          @jade.spinner(color=Secondary),
          @jade.spinner(color=Info),
          @jade.spinner(color=Success),
          @jade.spinner(color=Warning),
          @jade.spinner(color=Error),
        ]),
      ]),

      // Spinner sizes
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Spinner Sizes"),
        ]),
        div(class="flex items-center gap-6 flex-wrap", [
          @jade.spinner(size=Xs),
          @jade.spinner(size=Sm),
          @jade.spinner(size=Md),
          @jade.spinner(size=Lg),
          @jade.spinner(size=Xl),
        ]),
      ]),

      // Spinner in context
      div(class="mb-6", [
        h4(class="text-md font-medium mb-3 text-gray-600", [text("In Context")]),
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          div(class="flex flex-col gap-4", [
            // Loading button
            div(class="flex items-center gap-3", [
              @jade.spinner(),
              @html.p(class="text-gray-700", [text("Loading...")]),
            ]),
            // Loading card
            div(
              class="border rounded-lg p-4 flex items-center justify-center",
              [
                div(class="flex flex-col items-center gap-3", [
                  @jade.spinner(),
                  @html.p(class="text-gray-600", [text("Fetching data...")]),
                ]),
              ],
            ),
          ]),
        ]),
      ]),
    ]),

    // Tooltip component showcase
    div(class="max-w-6xl mx-auto mb-12", [
      h2(class="text-2xl font-bold mb-6 text-gray-800", [
        text("Tooltip Component Styles"),
      ]),

      // Tooltip placements
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Tooltip Placements"),
        ]),
        div(class="grid grid-cols-2 md:grid-cols-4 gap-8 p-8", [
          @jade.tooltip(
            content="This tooltip appears on top",
            placement=Top,
            children=@jade.button(
              [text("Top")],
              Increment,
              variant=Outlined,
              color=Primary,
              full_width=true,
            ),
          ),
          @jade.tooltip(
            content="This tooltip appears on bottom",
            placement=Bottom,
            children=@jade.button(
              [text("Bottom")],
              Increment,
              variant=Outlined,
              color=Primary,
              full_width=true,
            ),
          ),
          @jade.tooltip(
            content="This tooltip appears on left",
            placement=Left,
            children=@jade.button(
              [text("Left")],
              Increment,
              variant=Outlined,
              color=Primary,
              full_width=true,
            ),
          ),
          @jade.tooltip(
            content="This tooltip appears on right",
            placement=Right,
            children=@jade.button(
              [text("Right")],
              Increment,
              variant=Outlined,
              color=Primary,
              full_width=true,
            ),
          ),
        ]),
      ]),

      // Tooltip colors
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Tooltip Colors"),
        ]),
        div(class="grid grid-cols-2 md:grid-cols-4 gap-6", [
          @jade.tooltip(
            content="Primary tooltip",
            color=Primary,
            children=@jade.button(
              [text("Primary")],
              Increment,
              variant=Solid,
              color=Primary,
              full_width=true,
            ),
          ),
          @jade.tooltip(
            content="Secondary tooltip",
            color=Secondary,
            children=@jade.button(
              [text("Secondary")],
              Increment,
              variant=Solid,
              color=Secondary,
              full_width=true,
            ),
          ),
          @jade.tooltip(
            content="Success tooltip",
            color=Success,
            children=@jade.button(
              [text("Success")],
              Increment,
              variant=Solid,
              color=Success,
              full_width=true,
            ),
          ),
          @jade.tooltip(
            content="Warning tooltip",
            color=Warning,
            children=@jade.button(
              [text("Warning")],
              Increment,
              variant=Solid,
              color=Warning,
              full_width=true,
            ),
          ),
          @jade.tooltip(
            content="Error tooltip",
            color=Error,
            children=@jade.button(
              [text("Error")],
              Increment,
              variant=Solid,
              color=Error,
              full_width=true,
            ),
          ),
          @jade.tooltip(
            content="Info tooltip",
            color=Info,
            children=@jade.button(
              [text("Info")],
              Increment,
              variant=Solid,
              color=Info,
              full_width=true,
            ),
          ),
          @jade.tooltip(
            content="Dark tooltip",
            color=Dark,
            children=@jade.button(
              [text("Dark")],
              Increment,
              variant=Ghost,
              color=Primary,
              full_width=true,
            ),
          ),
          @jade.tooltip(
            content="Light tooltip",
            color=Light,
            children=@jade.button(
              [text("Light")],
              Increment,
              variant=Ghost,
              color=Primary,
              full_width=true,
            ),
          ),
        ]),
      ]),

      // Tooltip sizes
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Tooltip Sizes"),
        ]),
        div(class="flex items-center gap-6 flex-wrap", [
          @jade.tooltip(
            content="Small tooltip",
            size=Sm,
            children=@jade.button(
              [text("Small")],
              Increment,
              variant=Outlined,
              color=Primary,
            ),
          ),
          @jade.tooltip(
            content="Medium tooltip",
            size=Md,
            children=@jade.button(
              [text("Medium")],
              Increment,
              variant=Outlined,
              color=Primary,
            ),
          ),
          @jade.tooltip(
            content="Large tooltip",
            size=Lg,
            children=@jade.button(
              [text("Large")],
              Increment,
              variant=Outlined,
              color=Primary,
            ),
          ),
        ]),
      ]),

      // Tooltip with and without arrow
      div(class="mb-8", [
        h3(class="text-lg font-semibold mb-4 text-gray-700", [
          text("Tooltip Arrow Options"),
        ]),
        div(class="flex items-center gap-6 flex-wrap", [
          @jade.tooltip(
            content="Tooltip with arrow",
            arrow=true,
            children=@jade.button(
              [text("With Arrow")],
              Increment,
              variant=Outlined,
              color=Primary,
            ),
          ),
          @jade.tooltip(
            content="Tooltip without arrow",
            arrow=false,
            children=@jade.button(
              [text("No Arrow")],
              Increment,
              variant=Outlined,
              color=Primary,
            ),
          ),
        ]),
      ]),
    ]),
  ])
}

///|
/// Avatar 组件展示区域
fn render_avatar_section(_model : Model) -> Html[Msg] {
  @html.div([
    @jade.card(
      [
        @jade.card_header([@jade.typography([text("Avatar Component Styles")])]),
        @jade.card_body([
          // Avatar 尺寸展示
          @jade.typography(class="mb-4", [text("Avatar Sizes")]),
          @html.div(class="flex items-center gap-4 mb-8", [
            @jade.avatar(
              src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150",
              alt="User Avatar",
              fallback="U",
              size=@theme.Xs,
            ),
            @jade.avatar(
              src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150",
              alt="User Avatar",
              fallback="U",
              size=@theme.Sm,
            ),
            @jade.avatar(
              src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150",
              alt="User Avatar",
              fallback="U",
              size=@theme.Md,
            ),
            @jade.avatar(
              src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150",
              alt="User Avatar",
              fallback="U",
              size=@theme.Lg,
            ),
            @jade.avatar(
              src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150",
              alt="User Avatar",
              fallback="U",
              size=@theme.Xl,
            ),
          ]),

          // Avatar 形状展示
          @jade.typography(tag=@theme.H3, color=@theme.Default, class="mb-4", [
            text("Avatar Shapes"),
          ]),
          @html.div(class="flex items-center gap-4 mb-8", [
            @jade.avatar(
              src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150",
              alt="Round Avatar",
              fallback="R",
              size=@theme.Lg,
              shape=@theme.Circle,
            ),
            @jade.avatar(
              src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150",
              alt="Square Avatar",
              fallback="S",
              size=@theme.Lg,
              shape=@theme.Square,
            ),
          ]),

          // Avatar 颜色展示
          @jade.typography(tag=@theme.H3, color=@theme.Default, class="mb-4", [
            text("Avatar Colors (Fallback)"),
          ]),
          @html.div(class="flex items-center gap-4 mb-8", [
            @jade.avatar(fallback="P", size=@theme.Lg, color=@theme.Primary),
            @jade.avatar(fallback="S", size=@theme.Lg, color=@theme.Secondary),
            @jade.avatar(fallback="I", size=@theme.Lg, color=@theme.Info),
            @jade.avatar(fallback="S", size=@theme.Lg, color=@theme.Success),
            @jade.avatar(fallback="W", size=@theme.Lg, color=@theme.Warning),
            @jade.avatar(fallback="E", size=@theme.Lg, color=@theme.Error),
          ]),

          // Avatar 回退文本展示
          @jade.typography(tag=@theme.H3, color=@theme.Default, class="mb-4", [
            text("Avatar Fallback Examples"),
          ]),
          @html.div(class="flex items-center gap-4 mb-8", [
            @jade.avatar(fallback="JD", size=@theme.Lg, color=@theme.Primary),
            @jade.avatar(fallback="AB", size=@theme.Lg, color=@theme.Secondary),
            @jade.avatar(fallback="XY", size=@theme.Lg, color=@theme.Success),
          ]),
        ]),
      ],
      variant=@theme.Solid,
      color=@theme.Default,
    ),
  ])
}

///|
/// Renders the alert section showcasing different alert variants, colors, and features
fn[M] render_alert_section(_model : Model) -> @html.Html[M] {
  div(class="mb-8", [
    h2(class="text-2xl font-bold mb-6 text-gray-800", [text("Alert Components")]),

    // Alert Variants
    div(class="mb-8", [
      h3(class="text-lg font-semibold mb-4 text-gray-700", [
        text("Alert Variants"),
      ]),
      div(class="grid grid-cols-1 md:grid-cols-2 gap-4", [
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          h4(class="text-md font-medium mb-3 text-gray-600", [text("Solid")]),
          div(class="space-y-3", [
            @jade.alert_text(
              "This is a solid alert",
              variant=@theme.Solid,
              color=@theme.Info,
            ),
            @jade.alert_text(
              "Success message",
              variant=@theme.Solid,
              color=@theme.Success,
            ),
          ]),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          h4(class="text-md font-medium mb-3 text-gray-600", [text("Outlined")]),
          div(class="space-y-3", [
            @jade.alert_text(
              "This is an outlined alert",
              variant=@theme.Outlined,
              color=@theme.Info,
            ),
            @jade.alert_text(
              "Warning message",
              variant=@theme.Outlined,
              color=@theme.Warning,
            ),
          ]),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          h4(class="text-md font-medium mb-3 text-gray-600", [text("Ghost")]),
          div(class="space-y-3", [
            @jade.alert_text(
              "This is a ghost alert",
              variant=@theme.Ghost,
              color=@theme.Info,
            ),
            @jade.alert_text(
              "Error message",
              variant=@theme.Ghost,
              color=@theme.Error,
            ),
          ]),
        ]),
        div(class="bg-white rounded-lg p-6 shadow-sm", [
          h4(class="text-md font-medium mb-3 text-gray-600", [text("Gradient")]),
          div(class="space-y-3", [
            @jade.alert_text(
              "This is a gradient alert",
              variant=@theme.Gradient,
              color=@theme.Primary,
            ),
            @jade.alert_text(
              "Secondary message",
              variant=@theme.Gradient,
              color=@theme.Secondary,
            ),
          ]),
        ]),
      ]),
    ]),

    // Alert Colors
    div(class="mb-8", [
      h3(class="text-lg font-semibold mb-4 text-gray-700", [
        text("Alert Colors"),
      ]),
      div(class="bg-white rounded-lg p-6 shadow-sm", [
        div(class="space-y-3", [
          @jade.alert_text("Primary alert message", color=@theme.Primary),
          @jade.alert_text("Secondary alert message", color=@theme.Secondary),
          @jade.alert_text("Info alert message", color=@theme.Info),
          @jade.alert_text("Success alert message", color=@theme.Success),
          @jade.alert_text("Warning alert message", color=@theme.Warning),
          @jade.alert_text("Error alert message", color=@theme.Error),
        ]),
      ]),
    ]),

    // Alert with Icons and Dismissible
    div(class="mb-8", [
      h3(class="text-lg font-semibold mb-4 text-gray-700", [
        text("Alert with Icons and Dismissible"),
      ]),
      div(class="bg-white rounded-lg p-6 shadow-sm", [
        div(class="space-y-3", [
          @jade.alert(
            [text("Alert with icon")],
            variant=@theme.Outlined,
            color=@theme.Success,
            icon=Some(text("✓")),
          ),
          @jade.alert(
            [text("Dismissible alert - click X to close")],
            variant=@theme.Solid,
            color=@theme.Warning,
            dismissible=true,
          ),
          @jade.alert(
            [text("Alert with icon and dismissible")],
            variant=@theme.Ghost,
            color=@theme.Error,
            icon=Some(text("⚠")),
            dismissible=true,
          ),
        ]),
      ]),
    ]),

    // Complex Alert Content
    div(class="mb-8", [
      h3(class="text-lg font-semibold mb-4 text-gray-700", [
        text("Complex Alert Content"),
      ]),
      div(class="bg-white rounded-lg p-6 shadow-sm", [
        div(class="space-y-3", [
          @jade.alert(
            [
              div(class="", [
                h4(class="font-semibold mb-1", [text("Success!")]),
                @html.p(class="text-sm", [
                  text("Your operation has been completed successfully."),
                ]),
              ]),
            ],
            variant=@theme.Solid,
            color=@theme.Success,
            icon=Some(text("✓")),
            dismissible=true,
          ),
          @jade.alert(
            [
              div(class="", [
                h4(class="font-semibold mb-1", [text("Important Notice")]),
                @html.p(class="text-sm mb-2", [
                  text("Please review the following items:"),
                ]),
                @html.ul(class="text-sm list-disc list-inside space-y-1", [
                  @html.li([text("Check your email for confirmation")]),
                  @html.li([text("Update your profile information")]),
                  @html.li([text("Review privacy settings")]),
                ]),
              ]),
            ],
            variant=@theme.Outlined,
            color=@theme.Info,
            icon=Some(text("ℹ")),
          ),
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
    activeTab: "Tab1",
    checkbox1: true,
    checkbox2: true,
    checkbox3: true,
    checkbox4: true,
    checkbox5: true,
    checkbox6: true,
    selectedRadio: "option1",
    openAccordions: [],
    openMenus: [],
    switch_checked: false,
  }
  @tea.startup(model~, update~, view~)
}
