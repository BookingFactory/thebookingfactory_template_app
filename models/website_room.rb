class WebsiteRoom < Sequel::Model
  many_to_one :website_data
  one_to_many :room_types

  liquid_methods :name, :description, :room_types, :methods
end

WebsiteRoom.set_dataset :website_rooms
