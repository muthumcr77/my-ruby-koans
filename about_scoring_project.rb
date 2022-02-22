require File.expand_path(File.dirname(__FILE__) + '/neo')

def add_s(num)
  points = 0
  points += num
  return points
end
def calc(val)
  if val == 2
    s = add_s(200)
  elsif val == 3
    s = add_s(300)
  elsif val == 4
    s = add_s(400)
  elsif val == 6
    s = add_s(600)
  end
  return s
end

def score(dice)
  arx = Array.new
  s = 0
  dice.each do |item|              # factoring the array
    if item == 1 or 5
      arx << item
    elsif dice.count(item) > 2
      arx << item
    end
  end           
  while !arx.empty? do
    arx.each do |x|
      if x == 1 
        value = arx.count(x)
        arx.delete(x)
        if value == 1
          s += add_s(100)
        elsif value > 1  
          if value == 2
            s += add_s(200)
          elsif value == 3
            s += add_s(1000)
          elsif value == 4
            s += add_s(1100)
          elsif value == 5
            s += add_s(1200)
          end
        end
      elsif x == 5
        value = arx.count(x)
        arx.delete(x) 
        if value == 1
          s += add_s(50)
        elsif value > 1
          if value == 2
            s += add_s(100)
          elsif value == 3
            s += add_s(500)
          elsif value == 4
            s += add_s(550)
          elsif value == 5
            s += add_s(600)
          end
        end
      elsif x != 1 and 5 
        c = arx.count(x)
        if c > 2
          s += calc(x)
        end
        arx.delete(x) 
      end 
    end
  end
  return s
end

class AboutScoringProject < Neo::Koan
  def test_score_of_an_empty_list_is_zero
    assert_equal 0, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    assert_equal 50, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    assert_equal 100, score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    assert_equal 300, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    assert_equal 0, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
    assert_equal 1000, score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, score([2,2,2])
    assert_equal 300, score([3,3,3])
    assert_equal 400, score([4,4,4])
    assert_equal 500, score([5,5,5])
    assert_equal 600, score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, score([2,5,2,2,3])
    assert_equal 550, score([5,5,5,5])
    assert_equal 1100, score([1,1,1,1])
    assert_equal 1200, score([1,1,1,1,1])
    assert_equal 1150, score([1,1,1,5,1])
  end

end
