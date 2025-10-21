///|
/// Creates a configurable avatar component with customizable styling.
///
/// Parameters:
///
/// * `src` : String? - The image source URL. If None, displays fallback content.
/// * `alt` : String? - Alternative text for the image. Defaults to "Avatar".
/// * `fallback` : String? - Fallback text to display when image is not available.
///   If None, uses the first character of alt text.
/// * `size` : @theme.AvatarSize - The size of the avatar. Defaults to `@theme.Md`.
/// * `shape` : @theme.AvatarShape - The shape of the avatar. Defaults to `@theme.Circle`.
/// * `color` : @theme.AvatarColor - The color theme for fallback display. Defaults to `@theme.Neutral`.
/// * `class` : String? - Additional CSS class name to apply to the avatar.
///   Defaults to `None`.
///
/// Returns an HTML element configured with the specified properties and styling.
///
/// Example:
///
/// ```moonbit skip
/// // Avatar with image
/// let _ = avatar(
///   src="https://example.com/user.jpg",
///   alt="John Doe",
///   size=Lg,
///   shape=Circle
/// )
///
/// // Avatar with fallback text
/// let _ = avatar(
///   fallback="JD",
///   alt="John Doe",
///   size=Md,
///   color=Primary
/// )
/// ```
///
pub fn[M] avatar(
  src? : String,
  alt? : String,
  fallback? : String,
  size? : @theme.AvatarSize = @theme.Md,
  shape? : @theme.AvatarShape = @theme.Circle,
  color? : @theme.AvatarColor = @theme.Neutral,
  class? : String,
) -> @html.Html[M] {
  let container_style = @theme.get_avatar_style(size~, shape~, color~, class?)
  if src is Some(src) {
    let image_style = @theme.get_avatar_image_style(shape~)
    @html.div(class=container_style, [
      @html.img(src~, alt?, class=image_style, []),
    ])
  } else {
    let display_text = if fallback is Some(text) {
      text
    } else if alt is Some([first_char, ..]) {
      // Get first character of alt text, or "?" if empty
      first_char.to_string().to_upper()
    } else {
      "?"
    }
    @html.div(class=container_style, [@html.text(display_text)])
  }
}
