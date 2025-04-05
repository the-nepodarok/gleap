import dot_env/env
import gleam/result
import shork

fn connect() {
  // Start database connection
  shork.default_config()
  |> shork.user(env.get_string("DB_USER") |> result.unwrap("root"))
  |> shork.password(env.get_string("DB_PASSWORD") |> result.unwrap("password"))
  |> shork.database(env.get_string("DB_DATABASE") |> result.unwrap("test"))
  |> shork.connect
}

pub fn query(query: String, decoder) {
  let connection = connect()

  // Runs the query
  // The int 1 is given as parameter
  let assert Ok(response) =
    shork.query(query)
    |> shork.returning(decoder())
    |> shork.execute(connection)

  response.rows
}

pub type User {
  User(id: Int, name: String)
}
