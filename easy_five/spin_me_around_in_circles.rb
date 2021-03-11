# The returned string will not be the same object meaning that it will not have the same object_id
# as the string that was passed as an argument into the spin_me method.

# Code:
# def spin_me(str)
#  str.split.each do |word|
#    word.reverse!
#  end.join(" ")
# end
# spin_me("hello world") # "olleh dlrow"

# Explanation of the code:
# The string "hello world!" is passed into the spin_me method and then has the
# split method called on it, which will return an array containing 2 string elements ("hello"
# & "world"). The each method is called on this returned array. Each string element of the
# array is assigned to the local variable word, which has the mutating .reverse! method called on it.
# The .reverse! method permanently changes the state of the object that the local variable word points to.
# Specifically, the array that each was called on was changed from ["hello", "world"] to
# ["olleh", "dlrow"]. This changed array has the join method called on it. Since the join method call
# is the last expression of the spin_me method, the spin_me method's return value will be the same as the
# join inner method call's return value. The join method call returns the string "olleh dlrow". Through
# the transformation of the passed in string to an array that has its elements mutated and then joined
# together to return a string, the object_id of the passed in string will be different than the object_id
# of the spin_me method's returned string.

# Distinction:
# The fact that a mutating method is called on the string elements of the array does not force the
# object to have a different object id in the above case.

# Example tested in irb for burn effect:
# whitespace_str = "        hi!       "
# whitespace_str.object_id
#  => 17511200
# whitespace_str.strip!
#  => "hi!"
# whitespace_str.object_id
#  => 17511200
# whitespace_str still references the same object as the objet_id hasn't changed.
# However, the object itself has changed as all the blnak spaces have been removed
# by the mutating .strip! method call.

# Emphasize/make explicit a key point:
# the original object (= string passed into the spin_me method) is gone as soon as its converted into
# an array w/ the split method
