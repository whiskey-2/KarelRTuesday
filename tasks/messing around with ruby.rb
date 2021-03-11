 x = 50

 total = x

 x.times do
 	total -= 1
 	puts total
 end


  karel2 = ReneRobot.new(6, 1, Robota::EAST, 0)
  karel3 = ReneRobot.new(6, 6, Robota::SOUTH,0)
  karel4 = ReneRobot.new(1, 6, Robota::WEST, 0)


  robots = []
  robots << karel
  robots << karel2
  robots << karel3
  robots << karel4

  karel.put_beeper

  robots.each do |r|
    r.cycle