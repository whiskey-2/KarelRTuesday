$graphical = true

require_relative "../mixins/rene_beepers"
require_relative "../mixins/rene_turns"
require_relative "../mixins/sensor_pack"
require_relative "../karel/ur_robot"


class Boss < UrRobot
  include ReneTurns
  include ReneBeepers
  include SensorPack

  def safe_move
    if front_is_clear?
      move
    end
  end

  def safe_pick_beeper
    if next_to_a_beeper?
      pick_beeper
    else
      turn_off
    end
  end

  def safe_put_beeper
    if any_beepers_in_beeper_bag?
      put_beeper
    else
      turn_off
    end
  end

  def baseball(width) # w = la longeur d'un cote
    4.times do
      (width / 2).times do
        one_block_right
        put_beeper
        one_block_left
        put_beeper
      end
      turn_left
      beeper_every_other
      turn_around
      move
      move
      turn_around
    end
  end

  def reorganize(length, direction, distance)
    @arr = []
    o = 0
    length.times do
      while next_to_a_beeper?
        pick_beeper
        o = o + 1
      end
      @arr << o
      unless next_to_a_beeper?
        move
        o = 0
      end
    end
    if direction == 0
      turn_left
      distance.times do
        move
      end
      turn_left
      length.times do
        move
      end
      turn_around
    end
    if direction == 1
      turn_right
      distance.times do 
        move
      end
      turn_right
      length.times do 
        move
      end
      turn_around
    end
    (@arr).each do |r|
      if r == 0
        move
      end
      if r > 0
        r.times do
          put_beeper
        end
        move
      end
    end
  end

  def clone(length, direction, distance)
    @arr = []
    o = 0
    move
    length.times do
      while next_to_a_beeper?
        pick_beeper
        o = o + 1
      end
      @arr << o
      unless next_to_a_beeper?
        move
        o = 0
      end
    end
    turn_around
    ((@arr).reverse).each do |r|
      if r == 0
        move
      end
      if r > 0
        r.times do
          put_beeper
        end
        move
      end
    end
    if direction == 0
      turn_right
      distance.times do
        move
      end
      turn_right
      move
    end
    if direction == 1
      turn_left
      distance.times do 
        move
      end
      turn_left
      move
    end
    (@arr).each do |r|
      if r == 0
        move
      end
      if r > 0
        r.times do
          put_beeper
        end
        move
      end
    end
  end

end

@f = 15
@s = 200


def task()

  y = 1
  x = (@f / 2)

  world = Robota::World
  world.read_world("../worlds/shifts.txt")

  karel = Boss.new(1, 3, Robota::NORTH, INFINITY)
  karel.clone(10, 1, 7)
end


if __FILE__ == $0
  if $graphical
     screen = window(@f, @s) # (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end