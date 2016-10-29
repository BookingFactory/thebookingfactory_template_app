require 'sinatra/base'

module Sinatra
  module HTMLEscapeHelper
    def html_safe(text)
      Rack::Utils.escape_html(text)
    end
  end

  helpers HTMLEscapeHelper
end
