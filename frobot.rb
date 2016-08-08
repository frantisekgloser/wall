require './grobot'

class FlyingRobot < Robot 

  def move (x, y, z)
    @current_place = [x, y, z] 
    @items = self.get_items(@current_place)
    @items == nil || @items[0] == false ? puts("No weapon module here...") : @modules[0] = true && self.extend(WeaponModule) && puts('Yeah! Now I\'ve learned how to .shot.')
    @items == nil || @items[1] == false ? puts("No telecommunication module here...") : @modules[1] = true && self.extend(TelecommunicationModule) && puts('Yeah! Now I\'ve learned how to .send_message_to_headquarters.')
    @current_place
  end

end  