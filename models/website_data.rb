class WebsiteData < Sequel::Model
  many_to_one :hotel
  one_to_many :website_blog_records
  one_to_many :website_questions
  one_to_many :website_features
  one_to_many :website_footers
  one_to_many :website_rooms
  one_to_many :website_custom_rooms
  one_to_many :website_pages
  one_to_many :website_about_photos
  one_to_many :website_blog_records
  one_to_many :website_redirects
  one_to_many :website_domains
  one_to_many :website_links
  one_to_many :website_page_photos
  one_to_many :website_custom_room_photos
  one_to_many :website_translations
  one_to_many :website_testimonials

end

WebsiteData.set_dataset :website_data
