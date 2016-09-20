class WebsiteLink < Sequel::Model
  many_to_one :website_data

  liquid_methods :title, :value
end

WebsiteLink.set_dataset :website_links
