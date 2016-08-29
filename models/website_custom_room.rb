class WebsiteCustomRoom < Sequel::Model
  one_to_many :website_data
  many_to_one :website_custom_room_photos
end

WebsiteCustomRoomPhoto.set_dataset :website_custom_room
