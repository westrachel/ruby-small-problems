numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
# pretty sure this should delete the element currently at the 1 index (which is 2)
# so, expecting numbers to be [1, 3, 4, 5]
# check prediction:
p numbers


numbers = [1, 2, 3, 4, 5]
numbers.delete(1)
# pretty sure this will delete the 1 element from the numbers array
# so, expecting numbers to be [2, 3, 4, 5]
# check prediction:
p numbers