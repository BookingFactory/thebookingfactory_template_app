class Photo < Sequel::Model
  many_to_one :hotel
  one_to_many :room_types

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

Photo.set_dataset :photos
