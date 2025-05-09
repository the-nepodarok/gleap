import gleam/int.{to_string}
import gleam/list
import gleap/models/gleaper.{type Gleaper}
import lustre/attribute.{autofocus, class, name, placeholder}
import lustre/element.{type Element, text}
import lustre/element/html.{button, div, form, h1, input, span, svg}
import lustre/element/svg

// pub fn root(items: List(Gleaper)) -> Element(t) {
//   h1([], [text("Hello, fellow gleaper")])
// }

pub fn root(items: List(Gleaper)) -> Element(t) {
  div([class("app")], [h1([class("app-title")], [text("Gleap")]), todos(items)])
}

fn todos(items: List(Gleaper)) -> Element(t) {
  div([class("todos")], [
    todos_input(),
    div([class("todos__inner")], [
      div(
        [class("todos__list")],
        items
          |> list.map(item),
      ),
      todos_empty(),
    ]),
  ])
}

fn todos_input() -> Element(t) {
  form(
    [
      class("add-todo-input"),
      attribute.method("POST"),
      attribute.action("/items/create"),
    ],
    [
      input([
        name("todo_title"),
        class("add-todo-input__input"),
        placeholder("What's your Gleaper's name?"),
        autofocus(True),
      ]),
    ],
  )
}

fn item(item: Gleaper) -> Element(t) {
  div([class("todo ")], [
    div([class("todo__inner")], [
      form(
        [
          attribute.method("POST"),
          attribute.action(
            "/items/" <> to_string(item.id) <> "/completion?_method=PATCH",
          ),
        ],
        [button([class("todo__button")], [svg_icon_checked()])],
      ),
      span([class("todo__title")], [text(item.name)]),
    ]),
    form(
      [
        attribute.method("POST"),
        attribute.action("/items/" <> to_string(item.id) <> "?_method=DELETE"),
      ],
      [button([class("todo__delete")], [svg_icon_delete()])],
    ),
  ])
}

fn todos_empty() -> Element(t) {
  div([class("todos__empty")], [])
}

fn svg_icon_delete() -> Element(t) {
  svg(
    [class("todo__delete-icon"), attribute.attribute("viewBox", "0 0 24 24")],
    [
      svg.path([
        attribute.attribute("fill", "currentColor"),
        attribute.attribute(
          "d",
          "M9,3V4H4V6H5V19A2,2 0 0,0 7,21H17A2,2 0 0,0 19,19V6H20V4H15V3H9M9,8H11V17H9V8M13,8H15V17H13V8Z",
        ),
      ]),
    ],
  )
}

fn svg_icon_checked() -> Element(t) {
  svg(
    [class("todo__checked-icon"), attribute.attribute("viewBox", "0 0 24 24")],
    [
      svg.path([
        attribute.attribute("fill", "currentColor"),
        attribute.attribute(
          "d",
          "M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z",
        ),
      ]),
    ],
  )
}
