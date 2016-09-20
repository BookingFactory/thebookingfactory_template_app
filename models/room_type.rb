class RoomType < Sequel::Model
  many_to_one :website_rooms

  liquid_methods :id, :photos, :methods
end

RoomType.set_dataset :room_types
