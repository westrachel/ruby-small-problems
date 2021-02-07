produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# define select_fruit method such that:
#select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

def select_fruit(produce_hash)
  fruits_hash = produce_hash.select {|key, value| value == "Fruit"}
  fruits_hash
end

puts select_fruit(produce)



# alternative solution using loop:
def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  fruits = {}
  
  loop do
    break if counter == produce_keys.size
    
    current_key = produce_keys[counter]
    current_value = produce_list[current_key]
    
    if current_value == "Fruit"
      fruits[current_key] = current_value
    end
    
    counter += 1
  end
  
  fruits
end