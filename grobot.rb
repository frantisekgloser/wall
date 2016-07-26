require './items.rb'

class Robot (serial_number, x = 0, y = 0, z = 0)

  def initialize
    @place = [x, y, z]
  end


  def identify
    @serial_number
  end

  def move (x, y, z)
    @place[0] <> x ? 'Robot cann\'t fly'
    @place[1] = y
    @place[2] = z
    item?
  end

end  