require './place'
require './telecommunicationmodule'
require './weaponmodule'


class Robot 
  attr_reader :current_place

  def identify
    @serial_number
  end

  def get_items(current_place)
    @points = ObjectSpace.each_object(Place).to_a
    @points == [] || @points.find { |place| place.place == current_place } == nil ? @modules : @points.find { |place| place.place == current_place }.modules
  end

  def install_items(items)
    items == nil || items[0] == false ? puts("No weapon module here...") : @modules[0] = true && self.extend(WeaponModule) && puts('Yeah! Now I\'ve learned how to .shot.')
    items == nil || items[1] == false ? puts("No telecommunication module here...") : @modules[1] = true && self.extend(TelecommunicationModule) && puts('Yeah! Now I\'ve learned how to .send_message_to_headquarters.')
  end

  def move (x, y, z)
    if @current_place[0] == x  
      @current_place[1, 2] = [y, z]
      @items = self.get_items(@current_place)
      install_items(@items)
    else
      puts("Wheel robots cannot fly!")
    end
    @current_place
  end

  private

  def initialize (serial_number, x = 0, y = 0, z = 0)
    @serial_number = serial_number
    @current_place = [x, y, z]
    @modules = [false, false]
  end
  
end  
