class WebsiteCustomRoomPhoto < Sequel::Model
  one_to_many :website_custom_room

  FILE_FIELD = 'website_custom_room_photos'

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

WebsiteCustomRoomPhoto.set_dataset :website_custom_room_photos
