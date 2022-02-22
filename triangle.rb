# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#

def uniq_arr(arr)
  # mod must be true
  dup_add = 0
  if arr.uniq.size == 2   #calculate hypotenuse
    dup = arr.detect{|x| arr.count(x) == 2} # return duplicates
    dup_add = dup*2   #add dupes
    hyp = arr.reject{|x| x == dup}    # hypotenuse
  end
  # sides must not be < 1 and hyp < dup_add
  # check for (1,1,3)
  # return true if mod and
  mod = true
  if arr.detect{|x| x < 1} == nil
    if (arr.uniq.size == 1 or 3) || ((arr.uniq.size == 2) && (hyp[0] < dup_add))
      mod
    end
  else
    mod = false
  end
  mod
end

def triangle(a, b, c)
  arr = Array.new
  arr << a << b << c
  if arr.uniq.size == 2   #calculate hypotenuse
    dup = arr.detect{|x| arr.count(x) == 2} # return duplicates
    dup_add = dup*2   #add dupes
    hyp = arr.reject{|x| x == dup}    # hypotenuse
  end
  if uniq_arr(arr)
    if arr.uniq.count == 1
      :equilateral
    elsif (arr.uniq.count == 2)
      dup = arr.detect{|x| arr.count(x) == 2} # return duplicates
      dup_add = dup*2   #add dupes
      hyp = arr.reject{|x| x == dup}
      if hyp[0] < dup_add
        :isosceles
        next
      end
    elsif arr.uniq.count == 3
      :scalene
    end
  else
    raise TriangleError, "What a noob!" 
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
