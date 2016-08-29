class WebsiteLink < Sequel::Model
  many_to_one :website_data

end

WebsiteLink.set_dataset :website_links
