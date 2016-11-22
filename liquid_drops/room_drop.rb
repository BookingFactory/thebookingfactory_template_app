class RoomDrop < Liquid::Drop
  def initialize(room)
    @room = room
  end

  def description
  end

  def website_custom_room_photos
  end

  def icon
  end

  def meta_description
    @room.meta_description
  end
end
