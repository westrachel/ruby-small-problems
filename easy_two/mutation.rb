# think through the following code and try to predict what it wil print
# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# array2 = []
# array1.each { |value| array2 << value }
# array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# puts array2

# code breakdown:
# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# the above line assigns the variable array1 to an array made of strings 
# array2 = []   <=> this line assigns the variable, array2, to an empty array
# array1.each { |value| array2 << value }
# the each method is called on the array1 array and each element of array1 is pushed to array2
# array1.each { |value| value.upcase! if value.start_with?('C', 'S') } 
# the each method is called on array1 and through each iteration over array1, each letter of each string word 
# is captalized through the upcase method if that string word starts with C or S
# there is a ! added to the end of the upcase method, which permanently mutates the elements in array1
# such that if they satisfie the if condition they will be all uppercase lettered words
# puts array2
# this should print:
# all names with CURLY, SHEMP, and CHICO all uppercased
# array2 points to the same values as array1 and array1 had all its values permanently mutated if they met the if condition
