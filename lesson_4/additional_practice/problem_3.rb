# remove people w/ age 100 and greater from the given hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# solution 1:
ages.reject! { |name, age| age >= 100 }

# solution 2:
ages.select! { |name, age| age < 100 }
