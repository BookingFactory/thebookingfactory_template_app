class WebsiteRedirect < Sequel::Model
  many_to_one :website_data
end

WebsiteRedirect.set_dataset :website_redirects
