# numbers = [1, 2, 2, 3]
# numers.uniq

# puts numbers
# what do you expect the above to print?
# 1
# 2
# 2
# 3

# I'm pretty sure .uniq! mutates the caller, which would be numbers in this case, but 
# #uniq is non-mutating, so each element of the original numbers array should be printed