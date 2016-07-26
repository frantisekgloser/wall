require './items.rb'

class Robot (SERIALNUM, FLYING = true, place)

  DEFAULT_PLACE = [0, 0, 0]

  def initialize
    @place = place || DEFAULT_PLACE
  end


  def identify
    @SERIALNUM
  end

  def move (x, y, z)
    @place[0] = x || FLYING ? @place = [x, y, z] : 'Robot can\'t fly!!!'
    item
  end

end  