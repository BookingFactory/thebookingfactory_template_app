class WebsiteFooter < Sequel::Model
  many_to_one :website_data

  liquid_methods :title, :text
end

WebsiteFooter.set_dataset :website_footers
