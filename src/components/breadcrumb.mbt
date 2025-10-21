///|
/// Breadcrumb item data structure
pub(all) struct BreadcrumbItem[M] {
  text : String
  href : String?
  click : M?
  isActive : Bool
}

///|
/// Creates a breadcrumb navigation component with customizable styling.
///
/// Parameters:
///
/// * `items` : Array[BreadcrumbItem[M]] - Array of breadcrumb items to display
/// * `separator` : String - Custom separator between items (defaults to "/")
/// * `variant` : @theme.BreadcrumbVariant - Visual variant (defaults to Default)
/// * `color` : @theme.BreadcrumbColor - Color theme (defaults to Default)
/// * `size` : @theme.BreadcrumbSize - Size of the breadcrumb (defaults to Md)
/// * `class` : String? - Additional CSS classes
///
/// Returns an HTML nav element containing the breadcrumb navigation.
///
/// Example:
///
/// ```moonbit skip
/// enum Msg {
///   NavigateHome
///   NavigateProducts
/// }
/// 
/// let items = [
///   BreadcrumbItem::{ text: "Home", href: Some("/"), click: Some(NavigateHome), isActive: false },
///   BreadcrumbItem::{ text: "Products", href: Some("/products"), click: Some(NavigateProducts), isActive: false },
///   BreadcrumbItem::{ text: "Laptops", href: None, click: None, isActive: true }
/// ]
/// 
/// let _ = breadcrumb(
///   items,
///   separator="›",
///   variant=@theme.Bordered,
///   color=@theme.Primary,
///   size=@theme.Lg
/// )
/// ```
///
pub fn[M] breadcrumb(
  items : Array[BreadcrumbItem[M]],
  separator? : String = "/",
  variant? : @theme.BreadcrumbVariant = @theme.Default,
  color? : @theme.BreadcrumbColor = @theme.Default,
  size? : @theme.BreadcrumbSize = @theme.Md,
  class? : String,
) -> @html.Html[M] {
  let container_style = @theme.get_breadcrumb_style(
    variant~,
    color~,
    size~,
    class~,
  )
  let children = Array::new()
  for i, item in items.iter2() {
    // Add breadcrumb item
    let link_style = @theme.get_breadcrumb_link_style(
      color~,
      isActive=item.isActive,
      class=None,
    )
    let item_element = match (item.href, item.click, item.isActive) {
      // Active item (no link)
      (_, _, true) => @html.span(class=link_style, [@html.text(item.text)])
      // Clickable item with href
      (Some(href), Some(click), false) => {
        let attrs = [
          @html.attribute("href", href),
          @html.attribute("class", link_style),
          @html.on_click(fn(_) { click }),
        ]
        @html.node("a", attrs, [@html.text(item.text)])
      }
      // Clickable item without href
      (None, Some(click), false) =>
        @html.button(class=link_style, click~, [@html.text(item.text)])
      // Link-only item
      (Some(href), None, false) =>
        @html.a(href~, class=link_style, [@html.text(item.text)])
      // Plain text item
      (None, None, false) =>
        @html.span(class=link_style, [@html.text(item.text)])
    }
    children.push(item_element)

    // Add separator (except for last item)
    if i < items.length() - 1 {
      let separator_style = @theme.get_breadcrumb_separator_style()
      children.push(@html.span(class=separator_style, [@html.text(separator)]))
    }
  }
  let nav_attrs = [@html.attribute("class", container_style)]
  @html.node("nav", nav_attrs, children)
}

///|
/// Creates a simple breadcrumb from an array of strings with automatic active state.
/// The last item is automatically marked as active.
///
/// Parameters:
///
/// * `items` : Array[String] - Array of breadcrumb text items
/// * `separator` : String - Custom separator between items (defaults to "/")
/// * `variant` : @theme.BreadcrumbVariant - Visual variant (defaults to Default)
/// * `color` : @theme.BreadcrumbColor - Color theme (defaults to Default)
/// * `size` : @theme.BreadcrumbSize - Size of the breadcrumb (defaults to Md)
/// * `class` : String? - Additional CSS classes
///
/// Returns an HTML nav element containing the breadcrumb navigation.
///
/// Example:
///
/// ```moonbit skip
/// let _ = breadcrumb_simple(
///   ["Home", "Products", "Laptops"],
///   separator="›",
///   color=@theme.Primary
/// )
/// ```
///
pub fn[M] breadcrumb_simple(
  items : Array[String],
  separator? : String = "/",
  variant? : @theme.BreadcrumbVariant = @theme.Default,
  color? : @theme.BreadcrumbColor = @theme.Default,
  size? : @theme.BreadcrumbSize = @theme.Md,
  class? : String,
) -> @html.Html[M] {
  let breadcrumb_items = Array::new()
  for i, text in items.iter2() {
    let isActive = i == items.length() - 1
    breadcrumb_items.push(BreadcrumbItem::{
      text,
      href: None,
      click: None,
      isActive,
    })
  }
  breadcrumb(breadcrumb_items, separator~, variant~, color~, size~, class?)
}
