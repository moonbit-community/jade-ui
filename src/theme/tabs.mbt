///|
pub(all) enum TabsOrientation {
  Horizontal
  Vertical
}

///|
pub(all) enum TabsSize {
  Sm
  Md
  Lg
}

///|
pub(all) enum TabsVariant {
  Default
  Pills
  Underline
}

///|
pub fn get_tabs_style(
  orientation~ : TabsOrientation,
  class~ : String?,
) -> String {
  clsx([
    "flex gap-2",
    match orientation {
      Horizontal => "flex-col"
      Vertical => "flex-row"
    },
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_tabs_list_style(
  orientation~ : TabsOrientation,
  variant~ : TabsVariant,
  class~ : String?,
) -> String {
  clsx([
    "relative flex shrink-0 w-max",
    match orientation {
      Horizontal => "flex-row"
      Vertical => "flex-col"
    },
    match variant {
      Default => "bg-[var(--color-base-200)] p-1 rounded-md"
      Pills => "bg-[var(--color-base-200)] p-1 rounded-full"
      Underline =>
        "bg-transparent border-b border-gray-200 dark:border-gray-700 p-0"
    },
    class.unwrap_or(""),
  ])
}

///|
pub fn get_tabs_trigger_style(
  size~ : TabsSize,
  variant~ : TabsVariant,
  isActive~ : Bool,
  class~ : String?,
) -> String {
  clsx([
    "inline-flex relative z-[2] items-center justify-center align-middle select-none font-sans font-medium text-center transition-all duration-300 ease-in disabled:opacity-50 disabled:pointer-events-none cursor-pointer",
    // Size styles
    match size {
      Sm => "py-1 px-2 text-sm"
      Md => "py-1.5 px-3 text-sm"
      Lg => "py-2 px-4 text-base"
    },
    // Variant styles
    match variant {
      Default => "rounded text-[var(--color-base-content)]"
      Pills => "rounded-full text-[var(--color-base-content)]"
      Underline => "rounded-none border-b-2 text-[var(--color-base-content)]"
    },
    // Active state styles with built-in indicator
    if isActive {
      match variant {
        Default =>
          "bg-[var(--color-base-100)] text-[var(--color-base-content)] shadow-md"
        Pills =>
          "bg-[var(--color-base-100)] text-[var(--color-base-content)] shadow-md"
        Underline => "border-[var(--color-primary)] text-[var(--color-primary)]"
      }
    } else {
      "border-transparent"
    },
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}

///|
pub fn get_tabs_panel_style(class~ : String?) -> String {
  clsx([
    "p-1 w-full block",
    match class {
      Some(cls) => cls
      None => ""
    },
  ])
}
