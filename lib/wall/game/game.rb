
class Game

  attr_accessor :position

  GRID = 3

  def initialize
    @position = [1, 1]
  end

  def up
    position[0] < GRID ? position[0]+=1 : nil
    position
  end

  def down
    position[0] > 0 ? position[0]-=1 : nil
    position
  end

  def left
    position[1] > 0 ? position[1]-=1 : nil
    position
  end

  def right
    position[1] < GRID ? position[1]+=1 : nil
    position
  end

  def save
    file = File.open("./game.txt", "w")
    file.write(position)
    file.close
  end

  def load
    file = File.open("./game.txt", "r")
    position = file.read
    file.close
    position
  end

end