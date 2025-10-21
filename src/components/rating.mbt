///|
/// Creates a configurable rating component with customizable styling and
/// behavior for displaying and selecting ratings.
///
/// Parameters:
///
/// * `value` : Int - The current rating value (number of filled stars).
///   Defaults to `0`.
/// * `count` : Int - The total number of rating items (stars). Defaults to `5`.
/// * `color` : @theme.RatingColor - The color theme of the rating. Defaults to
///   `@theme.Primary`.
/// * `size` : @theme.RatingSize - The size of the rating icons. Defaults to
///   `@theme.Md`.
/// * `isReadonly` : Bool - Whether the rating is read-only. Defaults to `false`.
/// * `onValueChange` : (Int) -> M? - Optional callback function called when
///   rating value changes. Defaults to `None`.
/// * `class` : String? - Additional CSS class name to apply to the rating.
///   Defaults to `None`.
///
/// Returns an HTML div element configured with the specified properties and
/// styling.
///
/// Example:
///
/// ```moonbit skip
/// enum Msg {
///   RatingChanged(Int)
/// }
/// 
/// let _ = rating(
///   value=3,
///   count=5,
///   color=Primary,
///   size=Lg,
///   isReadonly=false,
///   onValueChange=fn(v) { Some(RatingChanged(v)) }
/// )
/// ```
///
pub fn[M] rating(
  value? : Int = 0,
  count? : Int = 5,
  color? : @theme.RatingColor = @theme.Primary,
  size? : @theme.RatingSize = @theme.Md,
  change? : (Int) -> M,
  class? : String,
) -> @html.Html[M] {
  let class = @theme.get_rating_style(class~)
  let stars = Array::new(capacity=count)
  for i = 0; i < count; i = i + 1 {
    let is_filled = i < value
    let star_svg = if is_filled {
      // Filled star
      @svg.node(
        "svg",
        [
          @svg.attribute("xmlns", "http://www.w3.org/2000/svg"),
          @svg.attribute("viewBox", "0 0 24 24"),
          @svg.attribute("fill", "currentColor"),
          @svg.attribute("class", "h-6 w-6"),
        ],
        [
          @svg.node(
            "path",
            [
              @svg.attribute("fill-rule", "evenodd"),
              @svg.attribute(
                "d", "M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.007 5.404.433c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.433 2.082-5.006z",
              ),
              @svg.attribute("clip-rule", "evenodd"),
            ],
            [],
          ),
        ],
      )
    } else {
      // Empty star
      @svg.node(
        "svg",
        [
          @svg.attribute("xmlns", "http://www.w3.org/2000/svg"),
          @svg.attribute("fill", "none"),
          @svg.attribute("viewBox", "0 0 24 24"),
          @svg.attribute("stroke-width", "1.5"),
          @svg.attribute("stroke", "currentColor"),
          @svg.attribute("class", "h-6 w-6"),
        ],
        [
          @svg.node(
            "path",
            [
              @svg.attribute("stroke-linecap", "round"),
              @svg.attribute("stroke-linejoin", "round"),
              @svg.attribute(
                "d", "M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z",
              ),
            ],
            [],
          ),
        ],
      )
    }
    let class = @theme.get_rating_icon_style(is_filled, color~, size~)
    let star_element = if change is Some(change) {
      @html.button(
        class=@theme.clsx([class, "cursor-pointer"]),
        click=change(i + 1),
        [star_svg.0],
      )
    } else {
      @html.span(class~, [star_svg.0])
    }
    stars.push(star_element)
  }
  @html.div(class~, stars)
}
