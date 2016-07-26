require './gitem'


class Robot 
  attr_reader :serial_number

  def initialize (serial_number, x = 0, y = 0, z = 0)
    @serial_number = serial_number
    @place = [x, y, z]
  end


  def identify
    @serial_number
  end

  def move (x, y, z)
    @place[0] = !x ? 'Robot cann\'t fly' : @place[1] = y && @place[2] = z
    items
  end

  def items (x, y, z)
    Place.TelecommunicationModule.exists ? TelecommunicationModule.include : nil
    Place.WeaponModule.exists ? WeaponModule.include : nil
  end

end  