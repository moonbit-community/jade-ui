///|
/// Input component theme configuration containing size, color, and variant
/// specifications for input elements.
///
/// This module defines the styling options for input components including
/// different sizes, colors, and visual states.
///

///|
/// Input size variants for different use cases.
///
/// * `Xs` - Extra small input, suitable for compact interfaces
/// * `Sm` - Small input, good for secondary actions
/// * `Md` - Medium input, the default size for most use cases
/// * `Lg` - Large input, for prominent or important inputs
/// * `Xl` - Extra large input, for maximum visibility
///
pub(all) enum InputSize {
  Xs
  Sm
  Md
  Lg
  Xl
} derive(Show, Eq)

///|
/// Input color variants for different semantic meanings.
///
/// * `Default` - Default color, neutral appearance
/// * `Primary` - Primary brand color
/// * `Secondary` - Secondary brand color
/// * `Info` - Informational color
/// * `Success` - Success state color
/// * `Warning` - Warning state color
/// * `Error` - Error state color
///
pub(all) enum InputColor {
  Default
  Primary
  Secondary
  Info
  Success
  Warning
  Error
} derive(Show, Eq)

///|
/// Input variant styles for different visual appearances.
///
/// * `Ghost` - Minimal styling with transparent background
/// * `Outlined` - Bordered style with outline
/// * `Solid` - Filled background style
/// * `Gradient` - Gradient background style
///
pub(all) enum InputVariant {
  Ghost
  Outlined
  Solid
  Gradient
} derive(Show, Eq)

///|
/// Get the CSS class for input size styling.
///
/// Parameters:
///
/// * `size` : InputSize - The size variant to get styling for
///
/// Returns a string containing the CSS classes for the specified size.
///
pub fn get_input_size_class(size : InputSize) -> String {
  match size {
    Xs => "h-6 px-2 text-xs rounded"
    Sm => "h-8 px-3 text-sm rounded"
    Md => "h-10 px-4 text-sm rounded-md"
    Lg => "h-12 px-4 text-base rounded-lg"
    Xl => "h-14 px-6 text-lg rounded-lg"
  }
}

///|
/// Get the CSS class for input color styling.
///
/// Parameters:
///
/// * `color` : InputColor - The color variant to get styling for
///
/// Returns a string containing the CSS classes for the specified color.
///
pub fn get_input_color_class(color : InputColor) -> String {
  match color {
    Default => "border-gray-300 focus:border-gray-500 focus:ring-gray-500/20"
    Primary => "border-gray-300 focus:border-blue-500 focus:ring-blue-500/20"
    Secondary =>
      "border-gray-300 focus:border-purple-500 focus:ring-purple-500/20"
    Info => "border-gray-300 focus:border-cyan-500 focus:ring-cyan-500/20"
    Success => "border-gray-300 focus:border-green-500 focus:ring-green-500/20"
    Warning =>
      "border-gray-300 focus:border-yellow-500 focus:ring-yellow-500/20"
    Error => "border-red-500 focus:border-red-500 focus:ring-red-500/20"
  }
}

///|
/// Get the CSS class for input variant styling.
///
/// Parameters:
///
/// * `variant` : InputVariant - The variant to get styling for
///
/// Returns a string containing the CSS classes for the specified variant.
///
pub fn get_input_variant_class(variant : InputVariant) -> String {
  match variant {
    Ghost =>
      "bg-transparent border-transparent hover:bg-gray-50 focus:bg-white focus:border-gray-300"
    Outlined =>
      "bg-white border border-gray-300 hover:border-gray-400 focus:border-blue-500"
    Solid =>
      "bg-gray-50 border border-gray-300 hover:bg-white focus:bg-white focus:border-blue-500"
    Gradient =>
      "bg-gradient-to-r from-blue-50 to-purple-50 border border-blue-200 hover:from-blue-100 hover:to-purple-100 focus:from-white focus:to-white focus:border-blue-500"
  }
}

///|
/// Get the complete CSS class string for input styling.
///
/// Parameters:
///
/// * `variant` : InputVariant - The visual style variant
/// * `size` : InputSize - The size of the input
/// * `color` : InputColor - The color theme
/// * `isError` : Bool - Whether the input is in error state
/// * `isSuccess` : Bool - Whether the input is in success state
/// * `isPill` : Bool - Whether to use pill shape
/// * `disabled` : Bool - Whether the input is disabled
/// * `className` : String? - Additional CSS classes
///
/// Returns a string containing all CSS classes for the input styling.
///
pub fn get_input_style(
  variant~ : InputVariant,
  size~ : InputSize,
  color~ : InputColor,
  is_error~ : Bool,
  is_success~ : Bool,
  is_pill~ : Bool,
  disabled~ : Bool,
  class~ : String?
) -> String {
  let base_classes = "w-full transition-all duration-200 ease-in-out outline-none focus:ring-2 focus:ring-offset-0"
  let size_class = get_input_size_class(size)
  let color_class = if is_error {
    "border-red-500 focus:border-red-500 focus:ring-red-500/20"
  } else if is_success {
    "border-green-500 focus:border-green-500 focus:ring-green-500/20"
  } else {
    get_input_color_class(color)
  }
  let variant_class = get_input_variant_class(variant)
  let shape_class = if is_pill { "rounded-full" } else { "" }
  let disabled_class = if disabled {
    "opacity-50 cursor-not-allowed"
  } else {
    ""
  }
  let placeholder_class = "placeholder:text-gray-400"
  let all_classes = [
    base_classes, size_class, color_class, variant_class, shape_class, disabled_class,
    placeholder_class,
  ]
  let combined = all_classes.join(" ")
  match class {
    Some(custom_class) => "\{combined} \{custom_class}"
    None => combined
  }
}
