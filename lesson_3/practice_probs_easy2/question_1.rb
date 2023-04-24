# check the hash for spot using 3 different strategies
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# strategy 1:
ages.include?("Spot") # returns false in irb

# strategy 2:
ages.fetch("Spot", "Spot isn't a key in the hash!") # set the default message to 'Spot isn't in the hash' to avoid the keyerror exception

# strategy 3:
ages.has_key?("Spot") # returns false in irb

# other strategies:
ages.key?("Spot")
ages.member?("Spot")