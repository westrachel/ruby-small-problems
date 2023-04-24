
#########################         PROBLEM 1:            ########################
# ['arc', 'bat', 'cape', 'ants', 'cap'].sort
# what should the above return?

# Expected Return Output:
# ['ants', 'arc', 'bat', 'cap', 'cape' ]

# Explain expectations:
# Based on String#<=> Ruby documentation, a word, word1, that starts the same way as another word, word2, but 
# has fewer letters will be less than that other word (word1 < word2).  
#      > The above learning informs why 'cap' comes before 'cape'
# Also, words startign with a should come before those starting with b and c



#########################         PROBLEM 2:            ########################
# [['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort

# Expected Return Output:
# [['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c'], ['b', 2]]

# Explain expectations:
# Based on Array#<=> Ruby documentation, array#<=> compares the index i element of the first array
# to the same index i of the other sub-arrays and does this one by one for all indices and only compares subseqent indices
# if that comparison is needed to determine an order. So, in the example array provided, 3 sub-arrays have 'a' as the starting
# element whereas the 4th sub-array starts w/ 'b'. Since 'a' <=> 'b' returns -1, the sub-array starting with 'b' will come last 
# in the sorted array. For ordering the remaining 3 sub-arrays, 'car' <=> 'cat' returns -1, so the sub-array with its 2nd element = 'cat',
# will be the second to last element in the sorted array. For the remaining 2 sub-arrays to sort, both have identical elements at their 1:3 
# indices, but these sub-arrays aren't fully identical, b/c one of the sub-arrays has one more element than the other.
# As shown by ruby documentation examples, an array with fewer elements than its compared to array that's otherwise equivalent will be 
# considered smaller. So, the array w/ 3 elements should come first in the sorted array. Then it's near identical sub-array that has 
# one more element, the integer 3 at the end, will come second.
