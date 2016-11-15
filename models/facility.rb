class Facility < Sequel::Model
  one_to_many :roomtypes_facilities
  many_to_many :room_types, :left_key => :facility_id,
               :right_key => :room_type_id, :join_table => :roomtypes_facilities
end
