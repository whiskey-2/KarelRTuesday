$graphical = true

require_relative "../karel/ur_robot"
require_relative "../mixins/rene_turns"
require_relative "../mixins/rene_beepers"
#taking relatives, more may be added


class Word < UrRobot
  include ReneTurns
  include ReneBeepers
  def lettre
    raise NotImplementedError, 'Vous devez ecrire la methode de parle'
  end
end

class H < Word
  def lettre
    beeper_5_infront
    turn_around
    move
    move
    turn_left
    beeper_3_infront
    turn_left
    beeper_2_infront
    turn_around
    move
    move
    beeper_2_infront
    move
    turn_around
    turn_off
  end
end

class E < Word
  def lettre
    beeper_infront
    turn_right
    beeper_2_infront
    turn_around
    move
    move
    turn_right
    beeper_2_infront
    turn_right
    beeper_2_infront
    turn_around
    move
    move
    turn_right
    beeper_2_infront
    turn_right
    beeper_2_infront
    turn_left
    move
    turn_off
  end
end

class L < Word
  def lettre
    beeper_infront
    turn_right
    beeper_2_infront
    turn_around
    move
    move
    turn_right
    beeper_4_infront
    move
    turn_off
  end
end

class O < Word
  def lettre
    beeper_infront
    turn_right
    beeper_2_infront
    turn_left
    beeper_4_infront
    turn_left
    beeper_2_infront
    turn_left
    beeper_3_infront
    move
    move
    turn_around
    turn_off
  end
end

class Gerant 
  def start
    karel = H.new(2, 2, Robota::NORTH, INFINITY)
    karel2 = E.new(2, 7, Robota::NORTH, INFINITY)
    karel3 = L.new(2, 11, Robota::NORTH, INFINITY)
    karel4 = L.new(2, 15, Robota::NORTH, INFINITY)
    karel5 = O.new(2, 19, Robota::NORTH, INFINITY)
    karel.lettre
    karel2.lettre
    karel3.lettre
    karel4.lettre
    karel5.lettre
  end
end


def task()
  world = Robota::World
  # world.read_world("../worlds/corridor.txt")
  gerant = Gerant.new
  gerant.start

end


if __FILE__ == $0
  if $graphical
     screen = window(22, 80) # (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end