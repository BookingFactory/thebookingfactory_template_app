require "sinatra"
require "sinatra/base"

class Link < Sinatra::Base

  module LinkToFilter

    def link_to url_fragment, mode=:path_only
      case mode
      when :path_only
        base = Link.request.script_name
      when :full_url
        if (request.scheme == 'http' && request.port == 80 ||
          request.scheme == 'https' && request.port == 443)
          port = ""
        else
          port = ":#{request.port}"
        end
        base = "#{request.scheme}://#{request.host}#{port}#{request.script_name}"
      else
        puts "Unknown script_url mode #{mode}"
      end
      "#{base}#{url_fragment}"
    end
  end

  Liquid::Template.register_filter(LinkToFilter)
end
