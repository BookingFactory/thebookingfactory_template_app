class WebsiteRoom < Sequel::Model
  many_to_one :website_data
  many_to_one :room_type

  liquid_methods :name, :visible, :title, :description, :slug
end

WebsiteRoom.set_dataset :website_rooms
