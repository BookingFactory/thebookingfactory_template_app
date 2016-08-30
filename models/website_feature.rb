class WebsiteFeature < Sequel::Model
  many_to_one :website_data

  liquid_methods :title, :description, :icon
end

WebsiteFeature.set_dataset :website_features
