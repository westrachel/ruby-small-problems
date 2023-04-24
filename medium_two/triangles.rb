# Problem:
# create a method that accepts three number inputs (integers only) that
#  represent the angle degrees of a triangle and outputs one of the following symbols
#  based on what kind of triangle it is:
#     > :acute (all 3 angles < 90 degrees)
#     > :obtuse (one angle > 90 degrees)
#     > :right (one angle = 90 degrees)
#     > :invalid (sum of angles != 180, or one or more angle = 0)

# Examples:
# triangle(60, 70, 50) == :acute
# triangle(30, 90, 60) == :right

# Code:
def triangle(x1, x2, x3)
  a = [x1, x2, x3]
  if a.include?(0) || a.sum != 180
    :invalid
  elsif a.include?(90)
    :right
  elsif a.max < 90
    :acute
  else
    :obtuse
  end
end

# check work:
p triangle(60, 70, 50) == :acute
# => true
p triangle(30, 90, 60) == :right
# => true
p triangle(120, 50, 10) == :obtuse
# => true
p triangle(0, 90, 90) == :invalid
# => true
p triangle(50, 50, 50) == :invalid
# => true
