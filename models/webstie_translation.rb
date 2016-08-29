class WebsiteTranslation < Sequel::Model
  many_to_one :website_data
end

WebsiteTranslation.set_dataset :website_translations
