class WebsiteAboutPhoto < Sequel::Model
  many_to_one :website_data

  FILE_FIELD = 'photos'

  def image
    {
      :id => self.id,
      :class_name => self.class.table_name,
      :file_field => FILE_FIELD,
      :file_name => self.photo_file_name
    }
  end

end

WebsiteAboutPhoto.set_dataset :website_about_photos
