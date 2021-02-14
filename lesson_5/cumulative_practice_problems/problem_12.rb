arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value:
# {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# write code to return a hash where the key is the first item in each sub-array and the value is the second item
arr.each_with_object({}) do |sub_array, returned_hash|
  returned_hash[sub_array[0]] = sub_array[1]
end
# => {:a =>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=> "D"}
# tested in irb to confirm the desired return value
