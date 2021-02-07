# A new empty hash is initialized in the each_with_object call on the given animal array
# Each String element in the called on animal array is assigned as a value in this new hash, 
# and its associated key is the first character of its String value.
#     <=> The first character of the String value is the key, because the code selects
#         the 0th element of each array's element as the key.
# The return value then is:
# { "a" => "ant", "b" => "bear", "c" => "cat"}
