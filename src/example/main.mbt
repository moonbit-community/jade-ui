///|
enum Msg {
  Increment
  Decrement
  SliderUpdate(Int)
  ReadMore
}

///|
struct Model {
  count : Int
}

///|
fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match msg {
    Increment => (none(), { ..model, count: model.count + 1 })
    Decrement => (none(), { ..model, count: @math.maximum(0, model.count - 1) })
    SliderUpdate(value) => (none(), { ..model, count: value })
    ReadMore => (none(), model)
  }
}

///|
fn view(model : Model) -> Html[Msg] {
  div(class="w-[600px] m-10 flex flex-col gap-8", [
    h1(class="text-2xl font-bold text-center select-none", [
      text("\{model.count}"),
    ]),
    div(class="flex justify-center gap-8 m-8", [
      @jade.button([text("+")], Increment, variant=Solid),
      @jade.button([text("-")], Decrement, variant=Solid),
    ]),
  ])
}

///| NOTE: This program is only available in the js backend, 
/// see README.md to getting started.
fn main {
  @theme.light().apply()
  let model = { count: 0 }
  @tea.startup(model~, update~, view~)
}

///|
test {
  fn flip(arr : Array[(Int, Int)]) {
    arr.map(x => (x.1, x.0))
  }

  inspect(flip([(1, 2), (3, 4)]), content="[(2, 1), (4, 3)]")
}
