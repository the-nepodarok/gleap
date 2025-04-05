import gleam/string
import gleap/db/db

pub fn get_all(table: String, decoder) {
  let q = string.append("SELECT * FROM ", table)

  db.query(q, decoder)
}
