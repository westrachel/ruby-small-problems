[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# w/o modifying the original array, use the map method to return a new array identical in structure
# to the original, but the value of each integer = incremented by 1


# first solution attempt:
new_array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  hsh.map do |key, value|
    return_array = []
    sub_hash = {}
    sub_hash[key] = value + 1
    return_array << sub_hash
  end
end

p new_array.flatten!
# the above solution doesn't have the correct structure; it returns:
# => [{:a=>2}, {:b=>3}, {:c=>4}, {:d=>5}, {:e=>6}, {:f=>7}]

# mutate new_array to merge desired hashes:
new_array[1].merge!(new_array[2])
p new_array # check merge

new_array.delete_at(2) # delete undesired extra {:c => 4} hash
p new_array # check deletion

new_array[2].merge!(new_array[3]) # merge {d: => 4} and {e: => 5} hashes
new_array.delete_at(3) # delete undesired extra {:e => 6} hash

new_array[2].merge!(new_array[3]) # merge {d: => 4, e: => 5} and {f: => 7} hashes
new_array.delete_at(3) # delete undesired extra {:f => 7} hash

# check work:
p new_array

# second solution attempt (want to make a more efficient solution than the first attempt above)
new_arr = []
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each do |sub_hash|
  modified_hash = sub_hash.each do |key, value|
    incremented_value = value + 1
    sub_hash[key] = incremented_value
  end
  new_arr << modified_hash
end

# check work:
p new_arr
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

# third solution that uses map, & is more efficient than solution 1 and 2:
new_arry = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |sub_hash|
  sub_hash.each do |key, value|
    incremented_value = value + 1
    sub_hash[key] = incremented_value
  end
end

# check work:
p new_arry
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]
