munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# print out the namge, age, and gender of each family member in the above hash like so:
# (Name) is a (age)-year-old (male or female).

munsters.each do |key, value|
  puts key + " is a #{value['age']}-year-old #{value['gender']}."
end