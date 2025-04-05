import dot_env
import dot_env/env
import gleam/erlang/process
import gleap/router
import gleap/web.{Context}
import mist
import wisp
import wisp/wisp_mist

pub fn main() {
  wisp.configure_logger()

  dot_env.new()
  |> dot_env.set_path(".env")
  |> dot_env.set_debug(False)
  |> dot_env.load

  let assert Ok(app_key) = env.get_string("APP_KEY")

  let ctx = Context(static_directory: get_static_dir())

  let handler = router.handle_request(_, ctx)

  let assert Ok(_) =
    wisp_mist.handler(handler, app_key)
    |> mist.new
    |> mist.port(88)
    |> mist.start_http

  process.sleep_forever()
}

fn get_static_dir() {
  let assert Ok(priv_directory) = wisp.priv_directory("gleap")
  priv_directory <> "/static"
}
