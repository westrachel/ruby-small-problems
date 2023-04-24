hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# write code to output the desired return value:
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# for each key, want to select:
#       > the colors sub-key's associated values array (with the array contents capitalized) if that key is a fruit (determined by type sub-key's value = fruit)
#       > the size sub-key's associated value string (all uppercase) if that key is a vegetable (determined by type sub-key's value = vegetable)

hsh.map do |sub_hash_array|
  if sub_hash_array[1][:type] == 'fruit'
    sub_hash_array[1][:colors].map do |color_str|
      color_str.capitalize
      end
  else # implied rule of problem scope: if the type key's associated value in the hash 'hsh' is not a fruit, then it's a vegetable
    sub_hash_array[1][:size].upcase
  end
end
#  => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
