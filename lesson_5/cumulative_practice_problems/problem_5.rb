munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of the male family members

total_male_age = 0

male_members = munsters.select do |key, value|
  value['gender'] == "male"
end

male_members.each do |key, value|
  total_male_age += value['age']
end

# check work:
p total_male_age