class WebsiteAboutPhoto < Sequel::Model
  many_to_one :website_data

end

WebsiteAboutPhoto.set_dataset :website_about_photos
