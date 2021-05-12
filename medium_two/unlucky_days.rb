# Problem:
# Create a method that accepts one integer input (the represents a year) and
#   calculates the # of Friday the 13ths in the year given by an argument

# Assumptions/constraints:
#   > inputted year is greater than 1752
#   > calendar days/months are part of the Gregorian calendar, which will
#        remain for the forseeable future

# Examples:
#friday_13th(2015) == 3
#friday_13th(1986) == 1
#friday_13th(2019) == 2

# Algorithm:
# 2. Initialize a Friday variable that is set to 1/1/XXXX where XXXX = the 
#      year integer passed in to the method
# 3. Start a loop construct:
#      i. Check if 1/1/XXXX is a Friday
#      ii. Add 1 day to 1/1/XXXX and check if that day is a Friday
#      iii. Repeat step ii. until the first Friday of the year is found
#      iv. reassign the Friday variable to the first Friday
# 4. Initialize a number of Friday the 13s variable and set it equal to 0
# 5. Start a new loop construct:
#     Add 7 days to the Friday variable (= the first run through = 1/X/XXXX + 7) and check if
#     the day is the 13th
#       > If it is the 13th, add 1 to the number of Friday the 13ths count variable
#       > If it's not repeat the loop and add another 7 days to the Friday variable
#       > Break out of the loop if adding 7 days caused the Friday variable's year to be
#           in XXXX + 1 (aka if have iterated through all Fridays of the passed in year)
# 6. Return the value of the number of Friday the 13ths variable

# Code:
require 'date'

def friday_13th(year)
  friday = Date.new(year, 1, 1)
  loop do
    break if friday.friday?
    friday = friday.next
  end
  count_friday_13s = 0
  loop do
    friday += 7
    if friday.day == 13
      count_friday_13s += 1
    end
    break if friday.year == (year + 1)
  end
  count_friday_13s
end

# check work:
p friday_13th(2015) == 3
# => true
p friday_13th(1986) == 1
# => true
p friday_13th(2019) == 2
# => true

# Further Exploration:
# Create a method that accepts one integer year input and counts the
#   number of months in that year that have 5 Fridays
#  >> make the method flexible enough to account for leap years

# Algorithm:
# 2. Initialize a Friday variable that is set to 1/1/XXXX where XXXX = the 
#      year integer passed in to the method
# 3. Start a loop construct:
#      i. Check if 1/1/XXXX is a Friday
#      ii. Add 1 day to 1/1/XXXX and check if that day is a friday
#      iii. Repeat step ii. until the first Friday of the year is found
#      iv. reassign the Friday variable to the first Friday
# 4. Initialize a number of Fridays variable and set it equal to 1
# 5. Initialize a number of months with 5 Fridays variable and set it equal to 0
# 6. Initialize a current month variable and set it equal to 1
# 7. Start a new loop construct:
#      i. Start an inner loop construct within the new loop created in step 7.
#      ii. Add 7 days to the Friday variable (= the first run through = 1/X/XXXX + 7)
#      iii. Add 1 to the number of Fridays variable
#      iv. Check if the month is still 1
#      v. Break once the months variable is 1 greater than the current month variable 
#      vi. Check the number of Fridays variable and if it's equal to 5 then add 1 to the
#            number of months with 5 Fridays
#      vii. Reassign the current month variable to month of the Friday variable's current value
#      viii. Reassign the number of Fridays variable to 0
#      viii. repeat steps ii. through vii. until all months of the year passed in have been checked
#           for having 5 Fridays
#         <=> Break out of the loop if adding 7 days caused the Friday variable's year to be
#           in XXXX + 1 (aka if have iterated through all Fridays of the passed in year)
# 8. Return the value of the numbe months with 5 Fridays variable

def five_friday_months(year)
  friday = Date.new(year, 1, 1)
  loop do
    break if friday.friday?
    friday = friday.next
  end
  num_fridays = 1
  num_mos_5_fri = 0
  current_month = 1
  12.times do |month|
    loop do
      friday += 7
      num_fridays += 1
      break if friday.month > current_month
    end
    num_mos_5_fri += 1 if num_fridays == 5
    current_month = friday.month
    num_fridays = 0
  end
  num_mos_5_fridays
end

# The above is computationally time-intensive, refactor
#   to a less time-intensive approach:
def five_friday_months(year)
  friday = Date.new(year, 1, 1)
  loop do
    break if friday.friday?
    friday = friday.next
  end
  curr_month = 1
  num_fridays = 1
  mons_w_5_fri = 0
  loop do
    friday += 7
    mons_w_5_fri += 1 if num_fridays == 5
    num_fridays += 1
    if friday.month > curr_month
      curr_month += 1
      num_fridays = 1
    end
    break if friday.year == (year + 1)
  end
  mons_w_5_fri
end

# check work:
# 2021 months w/ 5 Fridays:
#  > jan, april, july, oct, dec
p five_friday_months(2021) == 5
# => true

# 2016 = leap year
# 2016 months w/ 5 Fridays:
#  > jan, april, july, sept, dec
p five_friday_months(2016) == 5
# => true

p five_friday_months(2008) == 4
# => true
