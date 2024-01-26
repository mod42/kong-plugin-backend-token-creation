
local typedefs      = require "kong.db.schema.typedefs"

return {
  name = "backend-token-creation",
  fields = {
    { consumer = typedefs.no_consumer },
    { protocols = typedefs.protocols_http },
    { config = {
        type = "record",
        fields = {
          { token_url = { type = "string", required = true }, },
          { client_id = { type = "string", required = true }, },
          { client_secret = { type = "string", required = false }, },
          { scope = { type = "string", required = false }, },
          { ssl_verify = { type = "boolean", default = true, }, },
          { credentials_send_in = {type = "string", default = "auth header", required = true, one_of = { "auth header", "body" },}, },
          { upstream_appid_header_name = { type = "string", required = false, default="myappid" }, },
          { upstream_appid_header_value = { type = "string", required = false, default="appid" }, },
        }
    }, },
  },
}