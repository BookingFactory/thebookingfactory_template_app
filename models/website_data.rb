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

  FIEL_FIELD = 'header_images'

  def header_image
    {
      :id => self.id,
      :class_name => self.class.table_name,
      :file_field => FIEL_FIELD,
      :file_name => self.header_image_file_name
    }
  end

  def features_background_image
    {
      :id => self.id,
      :class_name => self.class.table_name,
      :file_field => 'features_background_images',
      :file_name => self.features_background_image_file_name
    }
  end

  def top_links
    self.website_links_dataset.where(:zone => "top").sort_by(&:position)
  end

  def footer_links
    self.website_links_dataset.where(:zone => "footer").sort_by(&:position)
  end

  liquid_methods :header_image, :features_background_image

end

WebsiteData.set_dataset :website_data
