class GalleryPhoto < Sequel::Model
  many_to_one :hotel

  FILE_FIELD = 'photos'

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

GalleryPhoto.set_dataset :gallery_photos
