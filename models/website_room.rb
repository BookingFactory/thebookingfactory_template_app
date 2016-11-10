class WebsiteRoom < Sequel::Model
  many_to_one :website_data
  one_to_many :room_type

  liquid_methods :name, :visible, :title, :description
end

WebsiteRoom.set_dataset :website_rooms
