require './grobot.rb'

class FlyingRobot < Robot 

  def move (x, y, z)
    @place = [x, y, z]
    item?
  end

end  