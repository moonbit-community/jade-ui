///|
enum Msg {
  Increment
  Decrement
  SliderUpdate(Int)
  TabChange(String)
}

///|
struct Model {
  count : Int
  activeTab : String
}

///| 样式常量定义
let main_container_class = "max-w-6xl mx-auto mb-12"

///|
let section_spacing_class = "mb-8"

///|
let grid_layout_class = "grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-3"

///|
let flex_center_class = "flex justify-center gap-4"

///|
let card_grid_class = "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6"

///|
let button_grid_class = "flex items-center gap-3 flex-wrap"

///|
fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match msg {
    Increment => {
      let new_count = @cmp.minimum(100, model.count + 1)
      (none(), { ..model, count: new_count })
    }
    Decrement => {
      let new_count = @cmp.maximum(0, model.count - 1)
      (none(), { ..model, count: new_count })
    }
    SliderUpdate(value) => {
      let validated_value = @cmp.maximum(0, @cmp.minimum(100, value))
      (none(), { ..model, count: validated_value })
    }
    TabChange(tab) => (none(), { ..model, activeTab: tab })
  }
}

///| 计数器区域组件
fn render_counter_section(model : Model) -> Html[Msg] {
  @html.div(class=main_container_class, [
    @jade.card(
      [
        @jade.card_body([
          @jade.typography(
            tag=@theme.H3,
            color=@theme.Default,
            class="text-center select-none mb-4",
            [text("\{model.count}")],
          ),
          @html.div(class=flex_center_class, [
            @jade.button(
              [text("+")],
              Increment,
              variant=@theme.Solid,
              color=@theme.Primary,
            ),
            @jade.button(
              [text("-")],
              Decrement,
              variant=@theme.Solid,
              color=@theme.Primary,
            ),
          ]),
        ]),
      ],
      variant=@theme.Solid,
      color=@theme.Default,
    ),
  ])
}

///| 水平按钮组子组件
fn render_horizontal_button_groups() -> Html[Msg] {
  @html.div(class=section_spacing_class, [
    @jade.typography(tag=@theme.H3, color=@theme.Default, class="mb-4", [
      text("Horizontal Button Groups"),
    ]),
    @html.div(class="space-y-6", [
      // Solid 变体
      @jade.card(
        [
          @jade.card_header([
            @jade.typography(tag=@theme.H4, color=@theme.Default, [
              text("Solid Variant"),
            ]),
          ]),
          @jade.card_body([
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
        ],
        variant=@theme.Ghost,
        color=@theme.Default,
      ),

      // Outlined 变体
      @jade.card(
        [
          @jade.card_header([
            @jade.typography(tag=@theme.H4, color=@theme.Default, [
              text("Outlined Variant"),
            ]),
          ]),
          @jade.card_body([
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
        ],
        variant=@theme.Ghost,
        color=@theme.Default,
      ),

      // Ghost 变体
      @jade.card(
        [
          @jade.card_header([
            @jade.typography(tag=@theme.H4, color=@theme.Default, [
              text("Ghost Variant"),
            ]),
          ]),
          @jade.card_body([
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
        ],
        variant=@theme.Ghost,
        color=@theme.Default,
      ),
    ]),
  ])
}

///| 垂直按钮组子组件
fn render_vertical_button_groups() -> Html[Msg] {
  @html.div(class=section_spacing_class, [
    @jade.typography(tag=@theme.H3, color=@theme.Default, class="mb-4", [
      text("Vertical Button Groups"),
    ]),
    @html.div(class="flex gap-8", [
      @jade.card(
        [
          @jade.card_header([
            @jade.typography(tag=@theme.H4, color=@theme.Default, [
              text("Solid Vertical"),
            ]),
          ]),
          @jade.card_body([
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
        ],
        variant=@theme.Ghost,
        color=@theme.Default,
      ),
      @jade.card(
        [
          @jade.card_header([
            @jade.typography(tag=@theme.H4, color=@theme.Default, [
              text("Outlined Vertical"),
            ]),
          ]),
          @jade.card_body([
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
        ],
        variant=@theme.Ghost,
        color=@theme.Default,
      ),
    ]),
  ])
}

///| 按钮组尺寸子组件
fn render_button_group_sizes() -> Html[Msg] {
  @html.div(class=section_spacing_class, [
    @jade.typography(tag=@theme.H3, color=@theme.Default, class="mb-4", [
      text("Button Group Sizes"),
    ]),
    @html.div(class="space-y-4", [
      @jade.card(
        [
          @jade.card_header([
            @jade.typography(tag=@theme.H4, color=@theme.Default, [
              text("Small Size"),
            ]),
          ]),
          @jade.card_body([
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
        ],
        variant=@theme.Ghost,
        color=@theme.Default,
      ),
      @jade.card(
        [
          @jade.card_header([
            @jade.typography(tag=@theme.H4, color=@theme.Default, [
              text("Large Size"),
            ]),
          ]),
          @jade.card_body([
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
        ],
        variant=@theme.Ghost,
        color=@theme.Default,
      ),
    ]),
  ])
}

///| 按钮组展示区域
fn render_button_group_section() -> Html[Msg] {
  @html.div(class=main_container_class, [
    @jade.card(
      [
        @jade.card_header([
          @jade.typography(tag=@theme.H2, color=@theme.Default, [
            text("Button Group Component"),
          ]),
        ]),
        @jade.card_body([
          render_horizontal_button_groups(),
          render_vertical_button_groups(),
          render_button_group_sizes(),
        ]),
      ],
      variant=@theme.Solid,
      color=@theme.Default,
    ),
  ])
}

///| 按钮变体子组件
fn render_button_variants() -> Html[Msg] {
  @html.div(class=section_spacing_class, [
    @jade.typography(tag=@theme.H3, color=@theme.Default, class="mb-4", [
      text("Button Variants with All Colors"),
    ]),
    @html.div(class="space-y-6", [
      // Ghost 变体
      @jade.card(
        [
          @jade.card_header([
            @jade.typography(tag=@theme.H4, color=@theme.Default, [
              text("Ghost Variant"),
            ]),
          ]),
          @jade.card_body([
            @html.div(class=grid_layout_class, [
              @jade.button(
                [text("Primary")],
                Increment,
                variant=@theme.Ghost,
                color=@theme.Primary,
              ),
              @jade.button(
                [text("Secondary")],
                Increment,
                variant=@theme.Ghost,
                color=@theme.Secondary,
              ),
              @jade.button(
                [text("Info")],
                Increment,
                variant=@theme.Ghost,
                color=@theme.Info,
              ),
              @jade.button(
                [text("Success")],
                Increment,
                variant=@theme.Ghost,
                color=@theme.Success,
              ),
              @jade.button(
                [text("Warning")],
                Increment,
                variant=@theme.Ghost,
                color=@theme.Warning,
              ),
              @jade.button(
                [text("Error")],
                Increment,
                variant=@theme.Ghost,
                color=@theme.Error,
              ),
            ]),
          ]),
        ],
        variant=@theme.Ghost,
        color=@theme.Default,
      ),

      // Outlined 变体
      @jade.card(
        [
          @jade.card_header([
            @jade.typography(tag=@theme.H4, color=@theme.Default, [
              text("Outlined Variant"),
            ]),
          ]),
          @jade.card_body([
            @html.div(class=grid_layout_class, [
              @jade.button(
                [text("Primary")],
                Increment,
                variant=@theme.Outlined,
                color=@theme.Primary,
              ),
              @jade.button(
                [text("Secondary")],
                Increment,
                variant=@theme.Outlined,
                color=@theme.Secondary,
              ),
              @jade.button(
                [text("Info")],
                Increment,
                variant=@theme.Outlined,
                color=@theme.Info,
              ),
              @jade.button(
                [text("Success")],
                Increment,
                variant=@theme.Outlined,
                color=@theme.Success,
              ),
              @jade.button(
                [text("Warning")],
                Increment,
                variant=@theme.Outlined,
                color=@theme.Warning,
              ),
              @jade.button(
                [text("Error")],
                Increment,
                variant=@theme.Outlined,
                color=@theme.Error,
              ),
            ]),
          ]),
        ],
        variant=@theme.Ghost,
        color=@theme.Default,
      ),

      // Solid 变体
      @jade.card(
        [
          @jade.card_header([
            @jade.typography(tag=@theme.H4, color=@theme.Default, [
              text("Solid Variant"),
            ]),
          ]),
          @jade.card_body([
            @html.div(class=grid_layout_class, [
              @jade.button(
                [text("Primary")],
                Increment,
                variant=@theme.Solid,
                color=@theme.Primary,
              ),
              @jade.button(
                [text("Secondary")],
                Increment,
                variant=@theme.Solid,
                color=@theme.Secondary,
              ),
              @jade.button(
                [text("Info")],
                Increment,
                variant=@theme.Solid,
                color=@theme.Info,
              ),
              @jade.button(
                [text("Success")],
                Increment,
                variant=@theme.Solid,
                color=@theme.Success,
              ),
              @jade.button(
                [text("Warning")],
                Increment,
                variant=@theme.Solid,
                color=@theme.Warning,
              ),
              @jade.button(
                [text("Error")],
                Increment,
                variant=@theme.Solid,
                color=@theme.Error,
              ),
            ]),
          ]),
        ],
        variant=@theme.Ghost,
        color=@theme.Default,
      ),

      // Gradient 变体
      @jade.card(
        [
          @jade.card_header([
            @jade.typography(tag=@theme.H4, color=@theme.Default, [
              text("Gradient Variant"),
            ]),
          ]),
          @jade.card_body([
            @html.div(class=grid_layout_class, [
              @jade.button(
                [text("Primary")],
                Increment,
                variant=@theme.Gradient,
                color=@theme.Primary,
              ),
              @jade.button(
                [text("Secondary")],
                Increment,
                variant=@theme.Gradient,
                color=@theme.Secondary,
              ),
              @jade.button(
                [text("Info")],
                Increment,
                variant=@theme.Gradient,
                color=@theme.Info,
              ),
              @jade.button(
                [text("Success")],
                Increment,
                variant=@theme.Gradient,
                color=@theme.Success,
              ),
              @jade.button(
                [text("Warning")],
                Increment,
                variant=@theme.Gradient,
                color=@theme.Warning,
              ),
              @jade.button(
                [text("Error")],
                Increment,
                variant=@theme.Gradient,
                color=@theme.Error,
              ),
            ]),
          ]),
        ],
        variant=@theme.Ghost,
        color=@theme.Default,
      ),
    ]),
  ])
}

///| 按钮尺寸子组件
fn render_button_sizes() -> Html[Msg] {
  @html.div(class=section_spacing_class, [
    @jade.typography(tag=@theme.H3, color=@theme.Default, class="mb-4", [
      text("Button Sizes"),
    ]),
    @jade.card(
      [
        @jade.card_body([
          @html.div(class=button_grid_class, [
            @jade.button(
              [text("Extra Small")],
              Increment,
              variant=@theme.Solid,
              color=@theme.Primary,
              size=@theme.Xs,
            ),
            @jade.button(
              [text("Small")],
              Increment,
              variant=@theme.Solid,
              color=@theme.Primary,
              size=@theme.Sm,
            ),
            @jade.button(
              [text("Medium")],
              Increment,
              variant=@theme.Solid,
              color=@theme.Primary,
              size=@theme.Md,
            ),
            @jade.button(
              [text("Large")],
              Increment,
              variant=@theme.Solid,
              color=@theme.Primary,
              size=@theme.Lg,
            ),
            @jade.button(
              [text("Extra Large")],
              Increment,
              variant=@theme.Solid,
              color=@theme.Primary,
              size=@theme.Xl,
            ),
          ]),
        ]),
      ],
      variant=@theme.Ghost,
      color=@theme.Default,
    ),
  ])
}

///| 全宽按钮子组件
fn render_full_width_button() -> Html[Msg] {
  @html.div(class=section_spacing_class, [
    @jade.typography(tag=@theme.H3, color=@theme.Default, class="mb-4", [
      text("Button Full Width"),
    ]),
    @jade.card(
      [
        @jade.card_body([
          @jade.button(
            [text("Full Width Button")],
            Increment,
            variant=@theme.Solid,
            color=@theme.Primary,
            fullWidth=true,
          ),
        ]),
      ],
      variant=@theme.Ghost,
      color=@theme.Default,
    ),
  ])
}

///| 按钮样式展示区域
fn render_button_styles_section() -> Html[Msg] {
  @html.div(class=main_container_class, [
    @jade.card(
      [
        @jade.card_header([
          @jade.typography(tag=@theme.H2, color=@theme.Default, [
            text("Button Component Styles"),
          ]),
        ]),
        @jade.card_body([
          render_button_variants(),
          render_button_sizes(),
          render_full_width_button(),
        ]),
      ],
      variant=@theme.Solid,
      color=@theme.Default,
    ),
  ])
}

///| 卡片样式展示区域
fn render_card_styles_section() -> Html[Msg] {
  @html.div(class=main_container_class, [
    @jade.card(
      [
        @jade.card_header([
          @jade.typography(tag=@theme.H2, color=@theme.Default, [
            text("Card Component Styles"),
          ]),
        ]),
        @jade.card_body([
          @jade.typography(tag=@theme.H3, color=@theme.Default, class="mb-4", [
            text("Card Variants"),
          ]),
          @html.div(class=card_grid_class, [
            @jade.card(
              [
                @jade.card_header([
                  @jade.typography(tag=@theme.H4, color=@theme.Default, [
                    text("Ghost"),
                  ]),
                ]),
                @jade.card_body([
                  @jade.typography(tag=@theme.P, color=@theme.Default, [
                    text("This is a Ghost style card"),
                  ]),
                ]),
                @jade.card_footer([
                  @jade.button(
                    [text("Action")],
                    Increment,
                    variant=@theme.Solid,
                    color=@theme.Primary,
                    size=@theme.Sm,
                  ),
                ]),
              ],
              variant=@theme.Ghost,
              color=@theme.Default,
            ),
            @jade.card(
              [
                @jade.card_header([
                  @jade.typography(tag=@theme.H4, color=@theme.Default, [
                    text("Solid"),
                  ]),
                ]),
                @jade.card_body([
                  @jade.typography(tag=@theme.P, color=@theme.Default, [
                    text("This is a Solid style card"),
                  ]),
                ]),
                @jade.card_footer([
                  @jade.button(
                    [text("Action")],
                    Increment,
                    variant=@theme.Solid,
                    color=@theme.Primary,
                    size=@theme.Sm,
                  ),
                ]),
              ],
              variant=@theme.Solid,
              color=@theme.Info,
            ),
            @jade.card(
              [
                @jade.card_header([
                  @jade.typography(tag=@theme.H4, color=@theme.Default, [
                    text("Outlined"),
                  ]),
                ]),
                @jade.card_body([
                  @jade.typography(tag=@theme.P, color=@theme.Default, [
                    text("This is an Outlined style card"),
                  ]),
                ]),
                @jade.card_footer([
                  @jade.button(
                    [text("Action")],
                    Increment,
                    variant=@theme.Solid,
                    color=@theme.Primary,
                    size=@theme.Sm,
                  ),
                ]),
              ],
              color=Primary,
              variant=Outline,
            ),
            @jade.card(
              [
                @jade.card_header([
                  @jade.typography(tag=@theme.H4, color=@theme.Default, [
                    text("Gradient"),
                  ]),
                ]),
                @jade.card_body([
                  @jade.typography(tag=@theme.P, color=@theme.Default, [
                    text("This is a Gradient style card"),
                  ]),
                ]),
                @jade.card_footer([
                  @jade.button(
                    [text("Action")],
                    Increment,
                    variant=@theme.Solid,
                    color=@theme.Primary,
                    size=@theme.Sm,
                  ),
                ]),
              ],
              variant=Gradient,
              color=Info,
            ),
          ]),
        ]),
      ],
      variant=@theme.Solid,
      color=@theme.Default,
    ),
  ])
}

///| 排版展示区域
fn render_typography_section() -> Html[Msg] {
  @html.div(class=main_container_class, [
    @jade.card(
      [
        @jade.card_header([
          @jade.typography(tag=@theme.H2, color=@theme.Default, [
            text("Typography Component Styles"),
          ]),
        ]),
        @jade.card_body([
          // 标题样式
          @html.div(class=section_spacing_class, [
            @jade.typography(
              tag=@theme.H3,
              color=@theme.Default,
              class="mb-4",
              [text("Heading Styles")],
            ),
            @jade.card(
              [
                @jade.card_body([
                  @html.div(class="space-y-4", [
                    @jade.typography(tag=@theme.H1, color=@theme.Default, [
                      text("Heading 1 - The largest heading"),
                    ]),
                    @jade.typography(tag=@theme.H2, color=@theme.Default, [
                      text("Heading 2 - Secondary heading"),
                    ]),
                    @jade.typography(tag=@theme.H3, color=@theme.Default, [
                      text("Heading 3 - Tertiary heading"),
                    ]),
                    @jade.typography(tag=@theme.H4, color=@theme.Default, [
                      text("Heading 4 - Quaternary heading"),
                    ]),
                    @jade.typography(tag=@theme.H5, color=@theme.Default, [
                      text("Heading 5 - Quinary heading"),
                    ]),
                    @jade.typography(tag=@theme.H6, color=@theme.Default, [
                      text("Heading 6 - The smallest heading"),
                    ]),
                  ]),
                ]),
              ],
              variant=@theme.Ghost,
              color=@theme.Default,
            ),
          ]),

          // 颜色样式
          @html.div(class=section_spacing_class, [
            @jade.typography(
              tag=@theme.H3,
              color=@theme.Default,
              class="mb-4",
              [text("Typography Colors")],
            ),
            @jade.card(
              [
                @jade.card_body([
                  @html.div(class="space-y-4", [
                    @jade.typography(tag=@theme.P, color=@theme.Inherit, [
                      text(
                        "Inherit color - This text inherits the color from its parent element.",
                      ),
                    ]),
                    @jade.typography(tag=@theme.P, color=@theme.Default, [
                      text(
                        "Default color - This is the default text color for the theme.",
                      ),
                    ]),
                    @jade.typography(tag=@theme.P, color=@theme.Primary, [
                      text(
                        "Primary color - This text uses the primary theme color.",
                      ),
                    ]),
                    @jade.typography(tag=@theme.P, color=@theme.Secondary, [
                      text(
                        "Secondary color - This text uses the secondary theme color.",
                      ),
                    ]),
                    @jade.typography(tag=@theme.P, color=@theme.Success, [
                      text(
                        "Success color - This text indicates successful operations.",
                      ),
                    ]),
                    @jade.typography(tag=@theme.P, color=@theme.Info, [
                      text(
                        "Info color - This text provides informational content.",
                      ),
                    ]),
                    @jade.typography(tag=@theme.P, color=@theme.Warning, [
                      text(
                        "Warning color - This text indicates caution or warnings.",
                      ),
                    ]),
                    @jade.typography(tag=@theme.P, color=@theme.Error, [
                      text(
                        "Error color - This text indicates errors or problems.",
                      ),
                    ]),
                  ]),
                ]),
              ],
              variant=@theme.Ghost,
              color=@theme.Default,
            ),
          ]),
        ]),
      ],
      variant=@theme.Solid,
      color=@theme.Default,
    ),
  ])
}

///| 滑块展示区域
fn render_slider_section(model : Model) -> Html[Msg] {
  @html.div(class=main_container_class, [
    @jade.card(
      [
        @jade.card_header([
          @jade.typography(tag=@theme.H2, color=@theme.Default, [
            text("Slider Component Styles"),
          ]),
        ]),
        @jade.card_body([
          @jade.typography(tag=@theme.H3, color=@theme.Default, class="mb-4", [
            text("Slider Colors"),
          ]),
          @html.div(class="space-y-6", [
            @jade.card(
              [
                @jade.card_header([
                  @jade.typography(tag=@theme.H4, color=@theme.Default, [
                    text("Primary Color"),
                  ]),
                ]),
                @jade.card_body([
                  @jade.slider(
                    value=model.count,
                    min=0,
                    max=100,
                    color=@theme.Primary,
                    size=@theme.Md,
                    on_input=SliderUpdate(_),
                  ),
                  @jade.typography(
                    tag=@theme.Small,
                    color=@theme.Default,
                    class="mt-2",
                    [text("Value: \{model.count}")],
                  ),
                ]),
              ],
              variant=@theme.Ghost,
              color=@theme.Default,
            ),
            @jade.card(
              [
                @jade.card_header([
                  @jade.typography(tag=@theme.H4, color=@theme.Default, [
                    text("Secondary Color"),
                  ]),
                ]),
                @jade.card_body([
                  @jade.slider(
                    value=model.count,
                    min=0,
                    max=100,
                    color=@theme.Secondary,
                    size=@theme.Md,
                    on_input=SliderUpdate(_),
                  ),
                  @jade.typography(
                    tag=@theme.Small,
                    color=@theme.Default,
                    class="mt-2",
                    [text("Value: \{model.count}")],
                  ),
                ]),
              ],
              variant=@theme.Ghost,
              color=@theme.Default,
            ),
            @jade.card(
              [
                @jade.card_header([
                  @jade.typography(tag=@theme.H4, color=@theme.Default, [
                    text("Success Color"),
                  ]),
                ]),
                @jade.card_body([
                  @jade.slider(
                    value=model.count,
                    min=0,
                    max=100,
                    color=@theme.Success,
                    size=@theme.Md,
                    on_input=SliderUpdate(_),
                  ),
                  @jade.typography(
                    tag=@theme.Small,
                    color=@theme.Default,
                    class="mt-2",
                    [text("Value: \{model.count}")],
                  ),
                ]),
              ],
              variant=@theme.Ghost,
              color=@theme.Default,
            ),
          ]),
        ]),
      ],
      variant=@theme.Solid,
      color=@theme.Default,
    ),
  ])
}

///| 标签页展示区域
fn render_tabs_section(model : Model) -> Html[Msg] {
  @html.div(class=main_container_class, [
    @jade.card(
      [
        @jade.card_header([
          @jade.typography(tag=@theme.H2, color=@theme.Default, [
            text("Tabs Component Styles"),
          ]),
        ]),
        @jade.card_body([
          @jade.typography(tag=@theme.H3, color=@theme.Default, class="mb-4", [
            text("Tab Variants"),
          ]),
          @html.div(class="space-y-8", [
            // Default 变体
            @jade.card(
              [
                @jade.card_header([
                  @jade.typography(tag=@theme.H4, color=@theme.Default, [
                    text("Default Variant"),
                  ]),
                ]),
                @jade.card_body([
                  @jade.tabs([
                    @jade.tabs_list([
                      @jade.tabs_trigger(
                        [text("HTML")],
                        TabChange("tab1"),
                        is_active=model.activeTab == "tab1",
                      ),
                      @jade.tabs_trigger(
                        [text("React")],
                        TabChange("tab2"),
                        is_active=model.activeTab == "tab2",
                      ),
                      @jade.tabs_trigger(
                        [text("Vue")],
                        TabChange("tab3"),
                        is_active=model.activeTab == "tab3",
                      ),
                    ]),
                    @jade.tabs_panel(
                      [text("HTML content here")],
                      is_active=model.activeTab == "tab1",
                    ),
                    @jade.tabs_panel(
                      [text("React content here")],
                      is_active=model.activeTab == "tab2",
                    ),
                    @jade.tabs_panel(
                      [text("Vue content here")],
                      is_active=model.activeTab == "tab3",
                    ),
                  ]),
                ]),
              ],
              variant=@theme.Ghost,
              color=@theme.Default,
            ),

            // Pills 变体
            @jade.card(
              [
                @jade.card_header([
                  @jade.typography(tag=@theme.H4, color=@theme.Default, [
                    text("Pills Variant"),
                  ]),
                ]),
                @jade.card_body([
                  @jade.tabs([
                    @jade.tabs_list(variant=@theme.Pills, [
                      @jade.tabs_trigger(
                        [text("HTML")],
                        TabChange("tab1"),
                        is_active=model.activeTab == "tab1",
                        variant=@theme.Pills,
                      ),
                      @jade.tabs_trigger(
                        [text("React")],
                        TabChange("tab2"),
                        is_active=model.activeTab == "tab2",
                        variant=@theme.Pills,
                      ),
                      @jade.tabs_trigger(
                        [text("Vue")],
                        TabChange("tab3"),
                        is_active=model.activeTab == "tab3",
                        variant=@theme.Pills,
                      ),
                    ]),
                    @jade.tabs_panel(
                      [text("HTML content here")],
                      is_active=model.activeTab == "tab1",
                    ),
                    @jade.tabs_panel(
                      [text("React content here")],
                      is_active=model.activeTab == "tab2",
                    ),
                    @jade.tabs_panel(
                      [text("Vue content here")],
                      is_active=model.activeTab == "tab3",
                    ),
                  ]),
                ]),
              ],
              variant=@theme.Ghost,
              color=@theme.Default,
            ),

            // Underline 变体
            @jade.card(
              [
                @jade.card_header([
                  @jade.typography(tag=@theme.H4, color=@theme.Default, [
                    text("Underline Variant"),
                  ]),
                ]),
                @jade.card_body([
                  @jade.tabs([
                    @jade.tabs_list(
                      [
                        @jade.tabs_trigger(
                          [text("HTML")],
                          TabChange("tab1"),
                          is_active=model.activeTab == "tab1",
                          variant=@theme.Underline,
                        ),
                        @jade.tabs_trigger(
                          [text("React")],
                          TabChange("tab2"),
                          is_active=model.activeTab == "tab2",
                          variant=@theme.Underline,
                        ),
                        @jade.tabs_trigger(
                          [text("Vue")],
                          TabChange("tab3"),
                          is_active=model.activeTab == "tab3",
                          variant=@theme.Underline,
                        ),
                      ],
                      variant=@theme.Underline,
                    ),
                    @jade.tabs_panel(
                      [text("HTML content here")],
                      is_active=model.activeTab == "tab1",
                    ),
                    @jade.tabs_panel(
                      [text("React content here")],
                      is_active=model.activeTab == "tab2",
                    ),
                    @jade.tabs_panel(
                      [text("Vue content here")],
                      is_active=model.activeTab == "tab3",
                    ),
                  ]),
                ]),
              ],
              variant=@theme.Ghost,
              color=@theme.Default,
            ),
          ]),
        ]),
      ],
      variant=@theme.Solid,
      color=@theme.Default,
    ),
  ])
}

///| 芯片展示区域
fn render_chip_section() -> Html[Msg] {
  @html.div(class=main_container_class, [
    @jade.card(
      [
        @jade.card_header([
          @jade.typography(tag=@theme.H2, color=@theme.Default, [
            text("Chip Component Styles"),
          ]),
        ]),
        @jade.card_body([
          @jade.typography(tag=@theme.H3, color=@theme.Default, class="mb-4", [
            text("Chip Variants and Colors"),
          ]),
          @html.div(class="space-y-6", [
            @jade.card(
              [
                @jade.card_header([
                  @jade.typography(tag=@theme.H4, color=@theme.Default, [
                    text("Solid Chips"),
                  ]),
                ]),
                @jade.card_body([
                  @html.div(class="flex flex-wrap gap-3", [
                    @jade.chip(
                      [@jade.chip_label([text("Primary")])],
                      color=@theme.Primary,
                      variant=@theme.Solid,
                    ),
                    @jade.chip(
                      [@jade.chip_label([text("Secondary")])],
                      color=@theme.Secondary,
                      variant=@theme.Solid,
                    ),
                    @jade.chip(
                      [@jade.chip_label([text("Success")])],
                      color=@theme.Success,
                      variant=@theme.Solid,
                    ),
                    @jade.chip(
                      [@jade.chip_label([text("Warning")])],
                      color=@theme.Warning,
                      variant=@theme.Solid,
                    ),
                    @jade.chip(
                      [@jade.chip_label([text("Error")])],
                      color=@theme.Error,
                      variant=@theme.Solid,
                    ),
                  ]),
                ]),
              ],
              variant=@theme.Ghost,
              color=@theme.Default,
            ),
            @jade.card(
              [
                @jade.card_header([
                  @jade.typography(tag=@theme.H4, color=@theme.Default, [
                    text("Outlined Chips"),
                  ]),
                ]),
                @jade.card_body([
                  @html.div(class="flex flex-wrap gap-3", [
                    @jade.chip(
                      [@jade.chip_label([text("Primary")])],
                      color=@theme.Primary,
                      variant=@theme.Outline,
                    ),
                    @jade.chip(
                      [@jade.chip_label([text("Secondary")])],
                      color=@theme.Secondary,
                      variant=@theme.Outline,
                    ),
                    @jade.chip(
                      [@jade.chip_label([text("Success")])],
                      color=@theme.Success,
                      variant=@theme.Outline,
                    ),
                    @jade.chip(
                      [@jade.chip_label([text("Warning")])],
                      color=@theme.Warning,
                      variant=@theme.Outline,
                    ),
                    @jade.chip(
                      [@jade.chip_label([text("Error")])],
                      color=@theme.Error,
                      variant=@theme.Outline,
                    ),
                  ]),
                ]),
              ],
              variant=@theme.Ghost,
              color=@theme.Default,
            ),
            @jade.card(
              [
                @jade.card_header([
                  @jade.typography(tag=@theme.H4, color=@theme.Default, [
                    text("Chips with Dismiss"),
                  ]),
                ]),
                @jade.card_body([
                  @html.div(class="flex flex-wrap gap-3", [
                    @jade.chip(
                      [
                        @jade.chip_label([text("Dismissible")]),
                        @jade.chip_dismiss_trigger(Increment),
                      ],
                      color=@theme.Primary,
                    ),
                    @jade.chip(
                      [
                        @jade.chip_label([text("With Action")]),
                        @jade.chip_dismiss_trigger(Increment),
                      ],
                      color=@theme.Success,
                    ),
                    @jade.chip(
                      [
                        @jade.chip_label([text("Removable")]),
                        @jade.chip_dismiss_trigger(Increment),
                      ],
                      color=@theme.Warning,
                    ),
                  ]),
                ]),
              ],
              variant=@theme.Ghost,
              color=@theme.Default,
            ),
          ]),
        ]),
      ],
      variant=@theme.Solid,
      color=@theme.Default,
    ),
  ])
}

///| 主视图函数 - 重构版本
fn view(model : Model) -> Html[Msg] {
  @html.div(class="w-full min-h-screen p-8 bg-gray-50", [
    // 主标题
    @jade.typography(
      tag=@theme.H2,
      color=@theme.Default,
      class="text-center mb-8",
      [text("Jade UI Component Style Showcase")],
    ),

    // 各个组件展示区域
    render_counter_section(model),
    render_button_group_section(),
    render_button_styles_section(),
    render_card_styles_section(),
    render_typography_section(),
    render_slider_section(model),
    render_tabs_section(model),
    render_chip_section(),
  ])
}

///| NOTE: This program is only available in the js backend, 
/// see README.md to getting started.
fn main {
  @theme.light().apply()
  let model = { count: 0, activeTab: "tab1" }
  @tea.startup(model~, update~, view~)
}
