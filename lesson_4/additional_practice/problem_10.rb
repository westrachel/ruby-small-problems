munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# add another key-value pair into the nested hash values in the above hash
# specifically, each munsters family member's value should have an age_group key
# whose value falls into 1 of 3 categories: senior (65 +), adult (18 - 64), and kid (0 - 17)

# solution:
# first add in additional hash key-value pair to each of the existing hash's value 
# set each family member's age_group key's value to "kid"
default_age_group_hash ={ "age_group" => "kid" }
munsters = munsters.each do |member, value|
  munsters[member] = value.merge!(default_age_group_hash)
end

# check work, munsters hash should now have 3 key-value pairs within each nested value hash:
p munsters

# reassign age_group keys' values depending on the value associated w/ each member's age key
for key, value in munsters do
  if (18..64).include? munsters[key]["age"]
    munsters[key]["age_group"] = "adult"
  elsif munsters[key]["age"] >= 65
    munsters[key]["age_group"] = "senior"
  else
    "don't need to reassign the age_group key's value, because default kid value is appropriate"
  end
end

# check work:
p munsters

# alternative simpler solution:
munserts.each do |name, details|
  case details["age"]
  when 0..18
    details["age_group"] = "kid"
  when 18..65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
