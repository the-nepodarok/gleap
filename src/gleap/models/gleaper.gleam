import gleam/dynamic/decode
import gleap/gleam/model

pub type Gleaper {
  Gleaper(id: Int, name: String)
}

pub fn get_all() -> List(Gleaper) {
  model.get_all("test", map)
}

pub fn create_item(name: String) -> Gleaper {
  Gleaper(id: 1, name: name)
}

pub fn map() {
  use id <- decode.field(0, decode.int)
  use name <- decode.field(1, decode.string)

  decode.success(Gleaper(id, name))
}
