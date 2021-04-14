# Problem:
# create a method that accepts an integer and outputs an array of integers
#  bewteen 1 and that inputted integer

def sequence(num)
  1.upto(num).to_a
end

# check work:
p sequence(5) == [1, 2, 3, 4, 5]
# => true
p sequence(3) == [1, 2, 3]
# => true
p sequence(1) == [1]
# => true

# Further exploration:
# update the method to handle negative instances (or zero)
# <=> so, if -5 is inputted, then have the array count up from -5 to 1

def count_up(num)
  if num <= 0
    (num..1).to_a
  else
    1.upto(num).to_a
  end
end

# check work:
p count_up(0) == [0, 1]
# => true
p count_up(-5) == [-5, -4, -3, -2, -1, 0, 1] 
# => true

# add flexibility so that the method doesn't have to count up from
# 1 or count up to 1 if starting from a negative number
def range_arr(lower_bound, upper_bound)
  (lower_bound..upper_bound).to_a
end

# check work:
p range_arr(-3, 2) == [-3, -2, -1, 0, 1, 2]
# => true
