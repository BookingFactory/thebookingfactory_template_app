class WebsitePagePhoto < Sequel::Model
  one_to_many :website_page

  FILE_FIELD = 'website_page_photos'

  def image
    {
      :id => self.id,
      :class_name => self.class.table_name,
      :file_field => FILE_FIELD,
      :file_name => self.photo_file_name
    }
  end

  liquid_methods :image

end

WebsitePagePhoto.set_dataset :website_page_photos
