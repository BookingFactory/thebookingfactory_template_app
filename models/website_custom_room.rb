class WebsiteCustomRoom < Sequel::Model
  many_to_one :website_data
  many_to_one :website_custom_room_photos

  liquid_methods :title, :description
end

WebsiteCustomRoom.set_dataset :website_custom_rooms
