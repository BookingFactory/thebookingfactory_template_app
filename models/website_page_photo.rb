class WebsitePagePhoto < Sequel::Model
  one_to_many :website_page

end

WebsitePagePhoto.set_dataset :website_page_phots
