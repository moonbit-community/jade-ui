///|
pub(all) enum ButtonGroupOrientation {
  Horizontal
  Vertical
}

///|
pub(all) enum ButtonGroupVariant {
  Ghost
  Outlined
  Solid
  Gradient
}

///|
pub(all) enum ButtonGroupSize {
  Xs
  Sm
  Md
  Lg
  Xl
}

///|
pub(all) enum ButtonGroupColor {
  Primary
  Secondary
  Accent
  Neutral
  Base
  Info
  Success
  Warning
  Error
}

///|
pub fn get_button_group_style(
  orientation~ : ButtonGroupOrientation,
  fullWidth~ : Bool,
  class~ : String?,
) -> String {
  clsx([
    "inline-flex",
    // Full width style
    if fullWidth {
      "w-full"
    } else {
      ""
    },
    // Orientation styles
    match orientation {
      Horizontal =>
        clsx([
          "flex-row",
          // Remove borders and round corners for middle buttons
           "[&>*:not(:first-child):not(:last-child)]:rounded-none", "[&>*:first-child]:rounded-r-none",
          "[&>*:last-child]:rounded-l-none", "[&>*:not(:first-child)]:border-l-0",
        ])
      Vertical =>
        clsx([
          "flex-col",
          // Remove borders and round corners for middle buttons
           "[&>*:not(:first-child):not(:last-child)]:rounded-none", "[&>*:first-child]:rounded-b-none",
          "[&>*:last-child]:rounded-t-none", "[&>*:not(:first-child)]:border-t-0",
        ])
    },
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}
