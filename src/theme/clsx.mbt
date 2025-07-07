///|
pub fn clsx(classes : Array[String]) -> String {
  classes.filter(cls => cls != "").join(" ")
}
