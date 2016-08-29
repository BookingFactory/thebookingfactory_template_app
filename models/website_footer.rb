class WebsiteFooter < Sequel::Model
  many_to_one :website_data

end

WebsiteFooter.set_dataset :website_footers
