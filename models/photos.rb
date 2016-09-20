class Photo < Sequel::Model
  many_to_one :hotel

  FILE_FIELD = 'photos'

  def image
    puts '111'
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
