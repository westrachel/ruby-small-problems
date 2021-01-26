flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# add the family pet "Dino to the array

flintstones << "Dino"
# check work 
p flintstones

# alternative:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.length # => 6
flintstones[6] = "Dino" #indices start at 0, so add element at 6th indexed spot that is currently non-existent
# check work 
p flintstones
