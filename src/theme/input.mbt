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
pub fn get_input_size_class(is_pill : Bool, size : InputSize) -> String {
  let rounded = if is_pill {
    "rounded-full"
  } else {
    match size {
      Xs => "rounded"
      Sm => "rounded"
      Md => "rounded-md"
      Lg => "rounded-lg"
      Xl => "rounded-xl"
    }
  }
  let size_class = match size {
    Xs => "h-6 px-2 text-xs"
    Sm => "h-8 px-3 text-sm"
    Md => "h-10 px-4 text-sm"
    Lg => "h-12 px-4 text-base"
    Xl => "h-14 px-6 text-lg"
  }
  size_class + " " + rounded
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
  let color = match color {
    Default => "gray-500"
    Primary => "var(--color-primary)"
    Secondary => "var(--color-secondary)"
    Info => "var(--color-info)"
    Success => "var(--color-success)"
    Warning => "var(--color-warning)"
    Error => "var(--color-error)"
  }
  "focus:border-[\{color}] focus:ring-[\{color}]/20 hover:border-[\{color}] hover:ring-[\{color}]/20"
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
/// 优化后的输入框 variant 样式获取函数
pub fn get_input_variant_class(
  variant : InputVariant,
  is_error : Bool,
  is_success : Bool
) -> String {
  let border_class = if is_error {
    "border-[var(--color-error)]"
  } else if is_success {
    "border-[var(--color-success)] hover:border-[var(--color-success)] focus:border-[var(--color-success)] focus:ring-[var(--color-success)]/20"
  } else if variant == Outlined || variant == Solid {
    "border-gray-300"
  } else {
    ""
  }
  let variant_class = match variant {
    Ghost =>
      "bg-transparent border-transparent hover:bg-[var(--color-base-100)] focus:bg-[var(--color-base-100)]"
    Outlined => "bg-[var(--color-base-100)] border \{border_class}"
    Solid =>
      "bg-[var(--color-base-200)] border \{border_class} hover:bg-[var(--color-base-100)]"
  }
  clsx([border_class, variant_class])
}

///|
/// Get the complete CSS class string for input styling.
///
/// Parameters:
///
/// * `variant` : InputVariant - The visual style variant
/// * `size` : InputSize - The size of the input
/// * `color` : InputColor - The color theme
/// * `is_error` : Bool - Whether the input is in error state
/// * `is_success` : Bool - Whether the input is in success state
/// * `is_pill` : Bool - Whether to use pill shape
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
  let size_class = get_input_size_class(is_pill, size)
  let color_class = get_input_color_class(color)
  let variant_class = get_input_variant_class(variant, is_error, is_success)
  let disabled_class = if disabled {
    "opacity-50 cursor-not-allowed"
  } else {
    ""
  }
  let placeholder_class = "placeholder:text-gray-400"
  clsx([
    base_classes,
    size_class,
    color_class,
    variant_class,
    disabled_class,
    placeholder_class,
    class.unwrap_or(""),
  ])
}
