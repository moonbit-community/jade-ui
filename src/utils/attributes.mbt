///|
pub fn[M] atsx(map : Map[String, String]) -> Array[@html.Attribute[M]] {
  map
  .iter()
  .filter(entry => entry.0 != "")
  .map(entry => @html.attribute(entry.0, entry.1))
  .to_array()
}
