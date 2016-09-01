class RoomType < Sequel::Model
  one_to_many :website_rooms

  

  liquid_methods :id
end

RoomType.set_dataset :room_types
