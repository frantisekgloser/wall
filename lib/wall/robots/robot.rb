require_relative './place'
require_relative './telecommunication_module'
require_relative './weapon_module'

class Robot 
  attr_reader :place, :modules

  def initialize (serial_number, place, modules = [])
    @serial_number = serial_number
    @place = place
    @modules = modules
  end

  def identify
    @serial_number
  end

  def get_items
    @items = @place.modules
    @items == nil ? puts("No module to install...") : @items.each { |item| self.extend(item) }
    @modules == @modules + @items
    @items
  end

  def move (place_to)
    @place_to = place_to
    if @place.place[0] == @place_to.place[0]  
      @place = @place_to
      get_items
    else
      puts("Wheel robots cannot fly!")
    end
    @place
  end

end  
