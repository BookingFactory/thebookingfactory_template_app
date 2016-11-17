class WebsiteTemplate < Sequel::Model
  many_to_one :hotel
  one_to_one :website_data

end

WebsiteTemplate.set_dataset :website_templates
