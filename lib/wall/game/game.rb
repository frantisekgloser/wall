
class Game

#  attr_accessor :position

  GRID = 3

  def up(position)
    position[0] < GRID ? position[0]+=1 : nil
    return position
  end

  def down(position)
    position[0] > 0 ? position[0]-=1 : nil
    return position
  end

  def left(position)
    position[1] > 0 ? position[1]-=1 : nil
    return position
  end

  def right(position)
    position[1] < GRID ? position[1]+=1 : nil
    return position
  end

  def save

  end

  def self.load

  end

end