ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, 
         "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# Select minimum age from the hash above
# solution 1:
ages.values.sort[0]

# solution 2:
current_min_age = ages["Herman"] # set minimum age initially to the first key's value
ages.each_value do |age|
  if age < current_min_age
    current_min_age = age
  end
  current_min_age
end

# check work:
p current_min_age


# solution 3:
ages.values.min