ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash 
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

#check work 
puts ages

# different strategy:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash 
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

additional_ages.each do |key, value|
  ages[key] = value
end

#check work:
puts ages
