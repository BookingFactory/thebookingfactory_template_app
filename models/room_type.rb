class RoomType < Sequel::Model
  one_to_many :website_rooms
  one_to_many :roomtypes_facilities
  one_to_many :photos
  many_to_many :facilities, :left_key => :room_type_id,
               :right_key => :facility_id, :join_table => :roomtypes_facilities

  liquid_methods :photos, :facilities
end

RoomType.set_dataset :room_types
