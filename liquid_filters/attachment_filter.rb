require "sinatra"
require "sinatra/base"

class WebsiteHelper < Sinatra::Base

  register Sinatra::ConfigFile
  config_file "../config/config.yml"

  module AttachmentHelper
    def attachment_url(object, style)
      partition = partition_id(object[:id])
      "#{WebsiteHelper.settings.s3_url}#{object[:class_name]}/#{object[:file_field]}/#{partition[0]}/#{partition[1]}/#{partition[2]}/#{style}/#{object[:file_name]}"
    end

    private

    def partition_id(id)
      length = id.to_s.length
      partiion = "0" *  (9 - length)
      id.to_s.insert(0, partiion).scan(/.../)
    end
  end

  Liquid::Template.register_filter(AttachmentHelper)
end
