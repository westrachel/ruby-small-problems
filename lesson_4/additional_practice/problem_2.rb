# add all the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, 
         "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# solution 1:
ages.values.sum

# alternative solution:
ages.values.inject(:+)

# another alternative solution:
age_total = 0
for key, value in ages do
  age_total += value
end

p age_total # => 6174 as expected
