require 'io/console'
require './frobot'

GRID = 10

def read_char
  STDIN.echo = false
  STDIN.raw!

  input = STDIN.getc.chr
  if input == "\e" then
    input << STDIN.read_nonblock(3)
    input << STDIN.read_nonblock(2)
  end

  ensure
    STDIN.echo = true
    STDIN.cooked!

    return input
  end

def step(robot)  
  @char = read_char

  case @char
    when "\e[A"
      robot.move(robot.current_place[0], robot.current_place[1] + 1, robot.current_place[2])
    when "\e[B"
      robot.move(robot.current_place[0], robot.current_place[1] - 1, robot.current_place[2])
    when "\e[C"
      robot.move(robot.current_place[0], robot.current_place[1], robot.current_place[2] + 1)
    when "\e[D"
      robot.move(robot.current_place[0], robot.current_place[1], robot.current_place[2] - 1)
    when "q"
      robot.move(robot.current_place[0] + 1, robot.current_place[1], robot.current_place[2])
    when "a"
      robot.current_place[0] > 0 ? robot.move(robot.current_place[0] - 1, robot.current_place[1], robot.current_place[2])  : puts('Cannot fly under ground')
    when "w"
      robot.respond_to?(:shot) ? robot.shot : puts("I cannot shoot yet")
    when "s"
      robot.respond_to?(:send_message_to_headquarters) ? robot.send_message_to_headquarters || exit : puts("I cannot send message to headquarters yet")
  end
  puts "My position is" + robot.current_place.inspect
  puts "arrows move, q fly up, a fly down, w shoot, s message, x exit"
end

system "clear"
puts "Please choose W for wheel robot F for flying robot"

begin
  @robot_type = read_char
  case @robot_type
    when "w"
      robot = Robot.new('wheelrobot0001') || puts('Wheel robot')
    when "f"
      robot = FlyingRobot.new('flyingrobot0001') || puts('Flying robot')
  end
end until (@robot_type == 'w' || @robot_type == 'f')

@robot_type == 'w' ? x = robot.current_place[0] : x = rand(0..GRID)
y = rand(0..GRID)
z = rand(0..GRID)
placeweapon = Place.new(x, y, z, true)

@robot_type == 'w' ? x = robot.current_place[0] : x = rand(0..GRID)
y = rand(0..GRID)
z = rand(0..GRID)
placetelecommunication = Place.new(x, y, z, false, true)

system "clear"
step(robot) until( @char == 'x' )