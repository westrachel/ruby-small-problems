# note:
# object ids are really long from what I've seen, for the purpose of answering 
# this question, I'm going to make up shorter id #s for the unique objects that are only 3 digits long
# <=> same thing done in q#1

# line 12 should print: "a_outer is 42 with an id of: 000 before the block."
# line 13 should print: "b_outer is 'forty two' with an id of: 001 before the block."
# line 14 should print: "c_outer is [42] (an array w/ a single element) with an id of: 002 before the block."
# line 15 should print: "d_outer = 42 with an id of: 000 before the block"
# <=> so, before the block both a_outer and d_outer should have the same object_id number
# lines 12-15 print the same values as lines 12-15 in question 1, because the code up to that point hasn't changed

# line 18, an illustrative method is called, which contains the same code as that in the inner block in question 1

# describing what the puts will print within the method called in line 18:
# the puts in lines 37-40 should print the same values + ids as printed in lines 24-27 in question 1
# the only difference in lines 37-40 as compared to lines 24-27 in q #1, is that all instances of the word block
# in the puts string are replaced by the word method

# the puts in lines 37-40 should print the same values + ids as printed in lines 35-38 in question 1

# the puts in lines 64-67 should print the same values + ids as printed in lines 52-55 in question 1
# the only difference in lines 64-67 as compared to lines 52-55 in q #1, is that all instances of the word block
# in the puts string are replaced by the word method

# after an_illustrative_method call in line 18 within the fun_with_ids method:
# line 21 should print:
# "a_outer is 42 with an id of 000 BEFORE and 000 AFTER the method call"
# line 22 should print:
# "b_outer is "forty two" with an id of 001 BEFORE and 001 AFTER the method call"
# line 23 should print:
# "c_outer is [42] with an id of 002 BEFORE and 002 AFTER the method call"
# line 24 should print:
# "d_outer is 42 with an id of 000 BEFORE and 000 AFTER the method call"

# lines 21-24 do NOT print the same values and ids as lines 59-62 in q1
# b/c the letter_outer variables specified w/in the inner method call are self-contained w/in that method call

# lines 27-30 should still print the rescue puts "ugh ohhhh"
# b/c methods' scopes are self-contained
# and <letter>_inner_id and <letter>_inner for all letters = a, b, c, d
# are defined w/in the scope of an an_illustrative_method and aren't returned by that method
# so, these values aren't accessible in the outer method, fun_with_ids