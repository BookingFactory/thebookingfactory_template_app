class WebstePage < Sequel::Model
  many_to_one :website_data
  one_to_many :website_page_photos

end

WebstePage.set_dataset :website_pages
