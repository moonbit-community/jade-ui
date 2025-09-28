///|
pub(all) enum CheckboxSize {
  Sm
  Md
  Lg
}

///|
pub(all) enum CheckboxColor {
  Primary
  Secondary
  Info
  Success
  Warning
  Error
}

///|
pub fn get_checkbox_container_style(
  disabled~ : Bool,
  class~ : String?,
) -> String {
  clsx([
    "inline-flex items-center cursor-pointer select-none",
    // Disabled state
    if disabled {
      "opacity-50 cursor-not-allowed"
    } else {
      "cursor-pointer"
    },
    // Optional custom class name
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_checkbox_visual_style(
  size~ : CheckboxSize,
  color~ : CheckboxColor,
  disabled~ : Bool,
) -> String {
  clsx([
    "flex items-center justify-center rounded-md border-2 bg-white transition-all shadow-sm",
    // Size styles
    match size {
      Sm => "w-4 h-4"
      Md => "w-5 h-5"
      Lg => "w-6 h-6"
    },
    // Base border and focus styles
    "border-gray-300 peer-focus:ring-2 peer-focus:ring-opacity-50",
    // Color styles for checked state
    match color {
      Primary =>
        "peer-checked:bg-blue-600 peer-checked:border-blue-600 peer-focus:ring-blue-300"
      Secondary =>
        "peer-checked:bg-gray-600 peer-checked:border-gray-600 peer-focus:ring-gray-300"
      Info =>
        "peer-checked:bg-cyan-600 peer-checked:border-cyan-600 peer-focus:ring-cyan-300"
      Success =>
        "peer-checked:bg-green-600 peer-checked:border-green-600 peer-focus:ring-green-300"
      Warning =>
        "peer-checked:bg-yellow-600 peer-checked:border-yellow-600 peer-focus:ring-yellow-300"
      Error =>
        "peer-checked:bg-red-600 peer-checked:border-red-600 peer-focus:ring-red-300"
    },
    // Disabled state
    if disabled {
      "opacity-50"
    } else {
      ""
    },
  ])
}

///|
pub fn get_checkbox_icon_style(size~ : CheckboxSize) -> String {
  clsx([
    "text-white scale-0 transition-transform peer-checked:scale-100",
    // Size styles
    match size {
      Sm => "w-3 h-3"
      Md => "w-4 h-4"
      Lg => "w-5 h-5"
    },
  ])
}

///|
pub fn get_checkbox_label_style(
  size~ : CheckboxSize,
  disabled~ : Bool,
) -> String {
  clsx([
    "text-sm font-medium select-none",
    // Size styles
    match size {
      Sm => "text-sm"
      Md => "text-base"
      Lg => "text-lg"
    },
    // Disabled state
    if disabled {
      "opacity-50 cursor-not-allowed"
    } else {
      "cursor-pointer"
    },
  ])
}
