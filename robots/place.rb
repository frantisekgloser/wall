class Place
  attr_reader :place, :modules

  def initialize (x = 0, y = 0, z = 0, weapon_module = false, telecommunication_module = false)
 
    @modules = [false, false]
    @place = [x, y, z]
    puts 'place is on coordinates ' + @place.to_s
    @modules[0] = weapon_module || false
    puts 'Weapon module here is ' + @modules[0].to_s
    @modules[1] = telecommunication_module || false
    puts 'Telecommunication module here is ' + @modules[1].to_s 

  end

end 
