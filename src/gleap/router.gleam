import gleap/routes/gleaper_routes.{gleaper_middleware}
import gleap/views/layout.{layout}
import gleap/views/pages
import gleap/web.{type Context}
import lustre/element
import wisp.{type Request, type Response}

pub fn handle_request(req: Request, ctx: Context) -> Response {
  use req <- web.middleware(req, ctx)
  // use ctx <- gleaper_middleware(req, ctx)

  case wisp.path_segments(req) {
    // Homepage
    [] -> {
      [pages.home()]
      |> layout
      |> element.to_document_string_builder
      |> wisp.html_response(200)
    }

    // All the empty responses
    ["internal-server-error"] -> wisp.internal_server_error()
    ["unprocessable-entity"] -> wisp.unprocessable_entity()
    ["method-not-allowed"] -> wisp.method_not_allowed([])
    ["entity-too-large"] -> wisp.entity_too_large()
    ["bad-request"] -> wisp.bad_request()
    _ -> wisp.not_found()
  }
}
