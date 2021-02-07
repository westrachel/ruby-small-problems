# Calling shift on the provided hash should return in array format the first key-value
# pair listed in the hash. So, I'm expecting the return value of the shift call to be:
#   [a:, 'ant']
# Based on the Hash#shift Ruby documentation, shift appears to mutate the caller,
#   so if hash were to be called again, it would contain the second/only other
#   key-value pair. Specifically, after calling shift on hash, hash looks like:
#        { b: 'bear'}
