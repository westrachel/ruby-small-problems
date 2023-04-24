# object ids are really long from what I've seen, for the purpose of answering 
# this question, I'm going to make up shorter id #s for the unique objects that are only 3 digits long

# line 12 should print: "a_outer is 42 with an id of: 000 before the block."
# line 13 should print: "b_outer is 'forty two' with an id of: 001 before the block."
# line 14 should print: "c_outer is [42] (an array w/ a single element) with an id of: 002 before the block."
# line 15 should print: "d_outer = 42 with an id of: 000 before the block"
# <=> so, before the block both a_outer and d_outer should have the same object_id number

# line 24 should print: "a_outer id was 000 before the block and is 000 inside the block"
# line 25 should print: "b_outer id was 001 before the block and is 001 inside the bock"
# line 26 should print: "c_outer id was 002 before the block and is 002 inside the block"
# line 27 should print: "d_outer id was 000 before the block and is 000 inside the bock"

# line 35 should print: 
# "a_outer inside after reasignment is 22 with an id of 000 before and 003 after"
# line 36 should print: 
# "b_outer inside after reassingmnet is "thirty three" with an id of 001 before and 004 after"
# line 37 should print:
# "c_outer inside after reassignment is [44] with an id of 002 before and 005 after"
# line 38 should print: 
# "d_outer inside after reassignment is 44 with an id of 000 before and 006 after"

# line 52 should print: 
# "a_inner is 22 with an id of 003 inside the block (compared to 003 for outer)"
# line 53 should print:
# "b_inner is "thirty three" with an id of 004 inside the block compared to 004 for outer "
# line 54 should print:
# "c_outer is [44] with an id of 005 inside the block compared to 005 for outer"
# line 55 should print:
# "d_outer is 44 with an id of 006 inside the block compared to 006 for outer"

# line 59 should print:
# "a_outer is 22 with an id of 000 BEFORE and 003 AFTER the block"
# line 60 should print:
# "b_outer is "thirty three" with an id of 001 BEFORE and 004 AFTER the block"
# line 61 should print:
# "c_outer is [44] with an id of 002 BEFORE and 005 AFTER the block"
# line 62 should print:
# "d_outer is 44 with an id of 000 BEFORE and 006 AFTER the block"

# line 65 should print: "ugh ohhhh"    
# line 65 prints the rescue puts, b/c the a_inner and a_inner_id variables that are specified in line 65's 
# string interpolation were defined only w/in the inner scope initialized by the times do block 
# and so, a_inner_id and a_inner can't be accessed in the outer scope
# line 66 should print: "ugh ohhhh"
# same rationale as for line 65, line 66 will print the rescue puts value b/c b_inner and b_inner_id aren't accessible in the outer scope
# b/c they were initialized in an inner scope
# line 67 should print: "ugh ohhhh"
# same rationale as for line 65 & line 66, line 67 will print the rescue puts value b/c c_inner and c_inner_id aren't accessible in the outer scope
# b/c they were initialized in an inner scope
# line 68 should print: "ugh ohhhh"    
# same rationale as for line 65:67, line 68 will print the rescue puts value b/c d_inner and d_inner_id aren't accessible in the outer scope
# b/c they were initialized in an inner scope