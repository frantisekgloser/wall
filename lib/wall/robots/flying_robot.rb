require_relative './robot'

class FlyingRobot < Robot 

  def move (place_to)
    @place = place_to
    get_items
    @place
  end

end  