class RoomtypesFacility < Sequel::Model
  many_to_one :room_types
  many_to_one :facility
end

RoomtypesFacility.set_dataset :roomtypes_facilities
