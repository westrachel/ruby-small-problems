
# Working with Blocks:

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]


# Explanation:
# The select method is called on an array containing two hashes. Each sub-hash is passed into the 
# block and assigned to the local variable hash. Once in the block, the first sub-hash, sub-hash1, 
# has the all? method called on it. Each key/value pair of sub-hash1 is then passed into the block of the all?
# method and assigned to the local variables key & value. Within the all? method's block, the key/value pair 
# of each sub-hash is passed through an equivalence expression. This equivalence expression tests whether the string element
# at the 0th index of the string value is equivalent to the return value of its corresponding key symbol converted to a string.
# For the first iteration on sub-hash1, the all method's block return value is true, as the the key symbol converted to a string
# is the letter 'a', and the first element of the string value this key is associated with is 'a'. On the second iteration of the
# all? method call on sub-hash, the return value of the block of the all? method is false, b/c the the key symbol converted to a string
# is the letter 'b', and the first element of the string value this key is asscoiated with is 'e'. The all? method evaluates the return
# values of its block to determine what its method return value is. The all? method call's return value on sub-hash1 is false, because
# not all block return values were true. 

# The return value of the all? method call on sub-hash1 is the block return value of the outer select method call.
# The select method call will return an array containing the elements of the original collection for which the block return value is true.
# Since the select method's block return value for the first sub-hash, sub-hash1, is false, the sub-hash1 is not selected and will not be
# in the select method's returned array.

# The second sub-hash, sub-hash2, is passed into the block and assigned to the local variable hash. Subsequently, all? is called on sub-hash2,
# and the singular key/value pair of sub-hash2 is passed into the all? method call's block and assigned to the local variables key and value.
# Within the block, the string element at the 0th index of the string value is compared to the key symbol after the key symbol is converted to a string.
# For sub-hash2, this results in comparing 'c' with 'c', which returns true. Accordingly, the block's return value for the inner all? method call
# on sub-hash2 is true. The all? method call on sub-hash2 corresponds with only one iteration. Given that the one and only block return value is true
# for the all? method call on sub-hash2, the all? method call's return value is true. 

# The return value of the all? method call on sub-hash2 is the block return value of the outer select method call. Since this block return value
# is true for sub-hash2, the select method will select the sub-hash2 hash and include it in the new array that it returns.

# Since there are only 2 sub-hashes, there is no more iteration to explain. The select method call on the array containing hashes will return a
# new array containing only the second sub-hash contained in the original nested array.