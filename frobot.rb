require './grobot'

class FlyingRobot < Robot 

  def move (x, y, z)
    @place = [x, y, z]
    items
  end

end  