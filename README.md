# gleap

A silly test project with gleam using wisp and lustre.
I have a strong feeling this is not how Gleam should be used, but I don't care, it's been fun so far!

### Development

- `wisp` is used as the server
- `lustre` is used for frontend
- `shork` is used for MariaDB connection (connection params go to the env file)

### Paths
The current directory structure is a mess and needs to be reconsidered soon, but so far it looks like this:
* `gleap.gleam` is the entrypoint, much like the usual `index`.
* `router.gleam` and `web.gleam` I don't remember, they sort of handle the request, apply middlewares, etc.
* `db/db` is where DB connection is established and SQL queries are established
* `gleam/model` is kinda like the Model base class
* `/models` is where models go (MCV-paradigm Model, that is)<br>
A model needs to have a type declaration and a decoder function to map DB columns to the model's type.
* `/views/pages.gleam` is much akin to what I'm used to expect from a Controller, so I should probably move and rename that accordingly.
* `/views/pages/*` is where frontend happens, haven't looked much at it yet.
* `/priv/static` is where static files are stored and served from

The rest is pretty much unfinished, but it compiles and kinda works 
(so far it can only render a list of items from database)

```
gleam run   # Run the project
```
