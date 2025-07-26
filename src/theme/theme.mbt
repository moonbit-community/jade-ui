///|
/// Theme configuration for Jade UI components containing color scheme, border
/// radii, and size specifications.
///
/// Fields:
///
/// * `primary` : Primary brand color, the main color of your brand.
/// * `primaryContent` : Foreground content color to use on primary color.
/// * `secondary` : Secondary brand color, the optional, secondary color of your
///   brand.
/// * `secondaryContent` : Foreground content color to use on secondary color.
/// * `accent` : Accent brand color, the optional, accent color of your brand.
/// * `accentContent` : Foreground content color to use on accent color.
/// * `neutral` : Neutral dark color, for not-saturated parts of UI.
/// * `neutralContent` : Foreground content color to use on neutral color.
/// * `base100` : Base surface color of page, used for blank backgrounds.
/// * `base200` : Base color, darker shade, to create elevations.
/// * `base300` : Base color, even more darker shade, to create elevations.
/// * `baseContent` : Foreground content color to use on base color.
/// * `info` : Info color, for informative/helpful messages.
/// * `infoContent` : Foreground content color to use on info color.
/// * `success` : Success color, for success/safe messages.
/// * `successContent` : Foreground content color to use on success color.
/// * `warning` : Warning color, for warning/caution messages.
/// * `warningContent` : Foreground content color to use on warning color.
/// * `error` : Error color, for error/danger/destructive messages.
/// * `errorContent` : Foreground content color to use on error color.
/// * `radiusSelector` : Border radius for selectors.
/// * `radiusField` : Border radius for fields.
/// * `radiusBox` : Border radius for boxes.
/// * `sizeSelector` : Size for selectors.
/// * `sizeField` : Size for fields.
/// * `border` : Border width.
///
/// Example:
///
/// ```moonbit skip
/// let theme = JadeTheme::{
///   primary: "#3B82F6",
///   primaryContent: "#FFFFFF",
///   secondary: "#6366F1",
///   secondaryContent: "#FFFFFF",
///   accent: "#F59E0B",
///   accentContent: "#000000",
///   neutral: "#374151",
///   neutralContent: "#F3F4F6",
///   base100: "#FFFFFF",
///   base200: "#F9FAFB",
///   base300: "#F3F4F6",
///   baseContent: "#1F2937",
///   info: "#0EA5E9",
///   infoContent: "#FFFFFF",
///   success: "#10B981",
///   successContent: "#FFFFFF",
///   warning: "#F59E0B",
///   warningContent: "#000000",
///   error: "#EF4444",
///   errorContent: "#FFFFFF",
///   radiusSelector: "0.375rem",
///   radiusField: "0.5rem",
///   radiusBox: "0.75rem",
///   sizeSelector: "2.5rem",
///   sizeField: "2.75rem",
///   border: "1px"
/// }
///
/// // Apply theme to document
/// theme.apply()
///
/// // Convert to CSS custom properties
/// let styles = theme.to_styles()
/// inspect(styles.get("--color-primary"), content="#3B82F6")
/// ```
///
pub(all) struct JadeTheme {
  // Primary brand color, The main color of your brand
  primary : String
  // Foreground content color to use on primary color
  primaryContent : String
  // Secondary brand color, The optional, secondary color of your brand
  secondary : String
  // Foreground content color to use on secondary color
  secondaryContent : String
  // Accent brand color, The optional, accent color of your brand
  accent : String
  // Foreground content color to use on accent color
  accentContent : String
  // Neutral dark color, For not-saturated parts of UI
  neutral : String
  // Foreground content color to use on neutral color
  neutralContent : String
  // Base surface color of page, used for blank backgrounds
  base100 : String
  // Base color, darker shade, to create elevations
  base200 : String
  // Base color, even more darker shade, to create elevations
  base300 : String
  // Foreground content color to use on base color
  baseContent : String
  // Info color, For informative/helpful messages
  info : String
  // Foreground content color to use on info color
  infoContent : String
  // Success color, For success/safe messages
  success : String
  // Foreground content color to use on success color
  successContent : String
  // Warning color, For warning/caution messages
  warning : String
  // Foreground content color to use on warning color
  warningContent : String
  // Error color, For error/danger/destructive messages
  error : String
  // Foreground content color to use on error color
  errorContent : String
  // Border radius for selectors
  radiusSelector : String
  // Border radius for fields
  radiusField : String
  // Border radius for boxes
  radiusBox : String
  // Size for selectors
  sizeSelector : String
  // Size for fields
  sizeField : String
  // Border width
  border : String
} derive(FromJson, ToJson, Show, Eq)

///|
pub fn JadeTheme::to_styles(self : JadeTheme) -> Map[String, String] {
  {
    "--color-primary": self.primary,
    "--color-primary-content": self.primaryContent,
    "--color-secondary": self.secondary,
    "--color-secondary-content": self.secondaryContent,
    "--color-accent": self.accent,
    "--color-accent-content": self.accentContent,
    "--color-neutral": self.neutral,
    "--color-neutral-content": self.neutralContent,
    "--color-base-100": self.base100,
    "--color-base-200": self.base200,
    "--color-base-300": self.base300,
    "--color-base-content": self.baseContent,
    "--color-info": self.info,
    "--color-info-content": self.infoContent,
    "--color-success": self.success,
    "--color-success-content": self.successContent,
    "--color-warning": self.warning,
    "--color-warning-content": self.warningContent,
    "--color-error": self.error,
    "--color-error-content": self.errorContent,
    "--radius-selector": self.radiusSelector,
    "--radius-field": self.radiusField,
    "--radius-box": self.radiusBox,
    "--size-selector": self.sizeSelector,
    "--size-field": self.sizeField,
    "--border": self.border,
  }
}

///|
pub fn[M] JadeTheme::to_attributes(
  self : JadeTheme,
) -> Array[@html.Attribute[M]] {
  self.to_styles().iter().map(x => @html.style(x.0, x.1)).to_array()
}

///|
pub fn JadeTheme::apply(self : JadeTheme) -> Unit {
  self.to_styles().each((key, value) => set_style(key, value))
}

///|
extern "js" fn set_style(key : String, value : String) -> Unit = "(k,v) => document.documentElement.style.setProperty(k,v)"
