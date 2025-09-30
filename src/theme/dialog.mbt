// Dialog theme configuration
// Defines sizes, styles, and CSS classes for dialog components

// Dialog size enumeration

///|
pub(all) enum DialogSize {
  Xs
  Sm
  Md
  Lg
  Xl
  Screen
} derive(Eq, Show)

// Generate CSS classes for dialog overlay

///|
pub fn get_dialog_overlay_style(class? : String = "") -> String {
  let base_classes = "fixed inset-0 z-50 flex items-center justify-center"
  clsx([base_classes, class])
}

// Generate CSS classes for dialog content

///|
pub fn get_dialog_content_style(
  size~ : DialogSize,
  class? : String = "",
) -> String {
  let size_classes = match size {
    Xs => "max-w-xs w-full mx-4"
    Sm => "max-w-sm w-full mx-4"
    Md => "max-w-md w-full mx-4"
    Lg => "max-w-lg w-full mx-4"
    Xl => "max-w-xl w-full mx-4"
    Screen => "max-w-none w-full h-full m-0"
  }
  let base_classes = "relative bg-[var(--color-base-100)] rounded-lg shadow-xl flex flex-col max-h-[90vh] overflow-hidden"
  clsx([base_classes, size_classes, class])
}

// Generate CSS classes for dialog header

///|
pub fn get_dialog_header_style(class? : String = "") -> String {
  let base_classes = "flex items-center justify-between p-4 border-b border-gray-200"
  clsx([base_classes, class])
}

// Generate CSS classes for dialog footer

///|
pub fn get_dialog_footer_style(class? : String = "") -> String {
  let base_classes = "flex items-center justify-end gap-2 p-4 border-t border-gray-200"
  clsx([base_classes, class])
}

// Generate CSS classes for dialog close button

///|
pub fn get_dialog_close_button_style(class? : String = "") -> String {
  let base_classes = "flex items-center justify-center w-8 h-8 text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded-full cursor-pointer transition-colors duration-200 text-xl font-bold leading-none"
  clsx([base_classes, class])
}

// Generate CSS classes for dialog backdrop

///|
pub fn get_dialog_backdrop_style(class? : String = "") -> String {
  let base_classes = "absolute inset-0 bg-[#00000060]"
  clsx([base_classes, class])
}

// Generate CSS classes for dialog body

///|
pub fn get_dialog_body_style(class? : String = "") -> String {
  let base_classes = "flex-1 p-4 overflow-y-auto"
  clsx([base_classes, class])
}

// Generate CSS classes for dialog trigger

///|
pub fn get_dialog_trigger_style(class? : String = "") -> String {
  let base_classes = "cursor-pointer"
  clsx([base_classes, class])
}
