class WebsitePage < Sequel::Model
  many_to_one :website_data
  one_to_many :website_page_photos

  liquid_methods :title
end

WebsitePage.set_dataset :website_pages
