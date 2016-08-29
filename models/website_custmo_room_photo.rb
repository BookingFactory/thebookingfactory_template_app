class WebsiteCustomRoomPhoto < Sequel::Model
  one_to_many :website_custom_room
end

WebsiteCustomRoomPhoto.set_dataset :website_custom_room_photos
