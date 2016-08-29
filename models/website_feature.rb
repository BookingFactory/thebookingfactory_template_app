class WebsiteFeature < Sequel::Model
  many_to_one :website_data

end

WebsiteFeature.set_dataset :website_features
