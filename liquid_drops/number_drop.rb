class NumberDrop < Liquid::Drop
  def initialize(number)
    @number = number
  end

  def name
    @number.name
  end

  def description
    @number.description
  end

  def room_type
    @number.room_type
  end
end
