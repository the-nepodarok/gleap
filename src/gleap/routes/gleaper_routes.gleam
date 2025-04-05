import wisp.{type Request, type Response}
import gleap/web.{type Context}

pub fn gleaper_middleware(
  req: Request,
  ctx: Context,
  handle_request: fn(Context) -> Response,
) {
  // It will update the context with the fetched items
  // and pass it to the handle_request, like
  // handle_request(new_context)
  todo
}