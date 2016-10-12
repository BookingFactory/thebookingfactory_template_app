require 'pony'
require 'uri'

Pony.options = {
  :from => 'from',
  :via => 'smtp',
  :via_options => ''
}

if ENV["DATABASE_URL"]
  uri = URI.parse(ENV["DATABASE_URL"])
  ENV["DATABASE_NAME"] = uri.path.tr('/', '')
  ENV["DATABASE_USER"] = uri.user
  ENV["DATABASE_PASSWORD"] = uri.password
  ENV["DATABASE_HOST"] = uri.host
  ENV["DATABASE_PORT"] = uri.host || 5432
end
