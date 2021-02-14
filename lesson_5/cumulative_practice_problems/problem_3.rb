# for each of the following collections, write code to reference the letter 'g'

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr1[2][1][3]   
# breakdown of my solution:
# arr1 contains 3 elements, w/ the 3rd element being an array
# arr1[2] calls this 3rd element, arr1[2][1] calls the 2nd element of the array returned by arr1[2] 
# arr1[2][1] returns a sub-array that contains the letter 'g', w/ 'g' being located at the 3rd index

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]


arr2[1][:third][0]
# arr2 contains two hashes, and 'g' is located w/in the second hash
# arr2[1][:third] returns the value (which is the array containing 3 letters: g, h, and i) in the second hash associated w/ the third symbol key
# only want to return the letter g, which is located at the 0th index in the array value returned by the line above, 
# so add the [0] reference after [:third] in the chained reference

arr3 = [['abc'], ['def'], {third: ['ghi']}]

arr3[2][:third][0][0]
# arr3 contains two arrays and a hash, and 'g' is located w/in the hash
# arr3[2] selects the hash, and then arr3[2][:third] selects the value corresponding w/ the third symbol key
# the value corresponding w/ the third symbol key is an array containing one string element 'ghi'
# arr3[2][:third][0] <=> this will return the 'ghi' string, which is the element at the 0th index of the array value corresponding w/ the symbol key :third
# only want to return the letter g, which is at the 0th index of the 'ghi' string, so add another [0] reference to get to the final code
# that will return the letter g

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh1['b'][1]
# 'g' is located at the 1st index of the array value associated with the 'b' string key in hsh1

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

hsh2[:third].keys[0]

# hsh2 is a hash w/ symbols as keys and whose keys' corresponding values are hashes
# the letter 'g' is the symbol of the value hash associated with the third: symbol key
# hsh2[:third] returns the entire value hash w/ the g string symbol and its value 0
# chaining .keys onto the end of the above call will return an array of all the keys in the value hash
# there is only 1 key, which is the letter 'g', so hsh2[:third].keys would return an array containing just the letter 'g'
# I don't want to return an array, I just want to return the letter 'g', which is why [0] is added to the end of hsh2[:third].keys,
# as that will select the 0th index element from the array that contains just the letter 'g'