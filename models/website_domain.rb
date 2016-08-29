class WebsiteDomain < Sequel::Model
  many_to_one :website_data

end

WebsiteDomain.set_dataset :website_domains
