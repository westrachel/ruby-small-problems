name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

#What do you expect the above to print?
# I expect it to print BOB twice, with each print on separate lines

# the 3rd line permanently changes the string that name has been assigned to and capitalizes all letters in the word
# since save_name references the same string that name does and that string has been permanently changed, 
#       save_name also points to BOB capitalized