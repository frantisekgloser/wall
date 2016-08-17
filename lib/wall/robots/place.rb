class Place

  attr_reader :place, :modules

  def initialize (x = 0, y = 0, z = 0, modules = []) 
    @modules = modules
    @place = [x, y, z]
    puts 'place is on coordinates ' + @place.inspect
    @modules == [] ? puts('No modules here') : puts('Modules here are: ' + @modules.inspect)
  end

end 
