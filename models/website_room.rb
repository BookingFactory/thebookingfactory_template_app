class WebsiteRoom < Sequel::Model
  many_to_one :website_data
end

WebsiteRoom.set_dataset :website_rooms
