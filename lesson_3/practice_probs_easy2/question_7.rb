flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles) # 6 elements in the array
# flintstones << "Dino"
# could have also added "Dino" using Array#concat or Array#push 

# add multiple items to the array: Dino & Hoppy
flintstones[6..7] = %w(Dino Hoppy)
# check work
p flintstones

# different strategy:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.insert(6, "Dino", "Hoppy")
# check work
p flintstones


# other alternatives:
flintstones.push("Dino").push("Hoppy")
flintstones.concat(%w(Dino Hoppy))
