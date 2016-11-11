class RoomType < Sequel::Model
  one_to_many :website_rooms

  liquid_methods :id, :photos, :facilities, :methods
end

RoomType.set_dataset :room_types
