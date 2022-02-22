# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.

# Create Player class and Game class + Refactor code
class DiceSet
    def roll(num)
      @arr = Array.new
      num.times do
        @arr << rand(1..6)
      end
    end
  
    def values
      @arr
    end
end
dice = DiceSet.new
dice.roll(5)
$arr = dice.values
$points = 0
def get_arr()
  acc = Array.new
  $arr.each do |item|
    if item == 1 or 5
      acc << item
    elsif $arr.count(item) > 2
      acc << item
    end
  end
  return acc        #factored array
end

def add_s(num)
  $points += num
  return $points
end
def calc(val)
    if val == 2
      add_s(200)
    elsif val == 3
      add_s(300)
    elsif val == 4
      add_s(400)
    elsif val == 6
      add_s(600)
    end
end
arx = get_arr
while !arx.empty? do
  arx.each do |x|
    if x == 1 
      value = arx.count(x)
      arx.delete(x)
      if value == 1
        add_s(100)
      elsif value > 1  
        if value == 2
          add_s(200)
        elsif value == 3
          add_s(1000)
        elsif value == 4
          add_s(1100)
        elsif value == 5
          add_s(1200)
        end
      end
    elsif x == 5
      value = arx.count(x)
      arx.delete(x) 
      if value == 1
        add_s(50)
      elsif value > 1
        if value == 2
          add_s(100)
        elsif value == 3
          add_s(500)
        elsif value == 4
          add_s(550)
        elsif value == 5
          add_s(600)
        end
      end
    elsif x != 1 and 5 
      c = arx.count(x)
      if c > 2
        calc(x)
      end
      arx.delete(x) 
    end 
  end
end

if arx.empty?
  p "empty - success!"
else 
  p "not_empty - failed!"
end

puts "Dice roll: " + $arr.to_s
puts "Score: " + $points.to_s
