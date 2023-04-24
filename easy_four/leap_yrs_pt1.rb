def leap_year?(year)
  year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
end

# check work:
puts leap_year?(2016) #should return true
puts leap_year?(2015) #should return false
puts leap_year?(2100) #should return false
puts leap_year?(2400) #should return true
puts leap_year?(240000) #should return true
puts leap_year?(240001) #should return false
puts leap_year?(2000) #should return true
puts leap_year?(1900) #should return false
puts leap_year?(1752) #should return true
puts leap_year?(1700) #should return false
puts leap_year?(1) #should return false
puts leap_year?(100) #should return false
puts leap_year?(400) #should return true

# Further exploration:
def leap_yr?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end

# the above should incorrectly print false for years divisible by 400
# so, leap_yr?(2400) # should return false
puts leap_yr?(2400) # check understanding; does print false

# more complex solution:
def leap_yr?(yr)
  if yr % 4 == 0 && yr % 100 != 0
    true
  elsif yr % 100 == 0 && yr % 400 != 0
    false
  else
    yr % 400 == 0
  end
end

puts leap_yr?(2400) # should now print true