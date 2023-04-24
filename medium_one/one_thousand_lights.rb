# Problem:
# Given "n" number of lights that are initially turned off, create a method that prints out which
# lights are still on after "n" rounds of lightswitch toggling. 

# How lightswitching toggling works:
# n = 5  <=> so there are 5 light lights and 5 rounds
#
# In round 1, the multiple = 1, so all lightswitches will be turned on, as every number has 1 as a factor
# In round 2, the multiple = 2, so only lights 2 and 4 will be toggled/turned off (lights 1, 3, and 5 remain on)
# In round 3, the multiple = 3, so only the lightswitch corresponding with light 3 will be toggled and light 3 will be turned off
#        <=> in round 3, lights 1 and 5 remain on while all others (2, 3, and 4 are off)
# In round 4: the multiple = 4, so only the lightswitch corresponding with light 4 will be toggled and light 4 will be turned back on
#        <=> in round 4, lights 1, 4, and 5 are the only lights on
# In round 5: the multiple = 5, so only the lightswitch corresponding with light 5 will be toggled and light 5 will be turned off
#        <=> this leaves lights 1 and 4 as the only ones on after all 5 aka "n" repetitions

# Example of desired method output:
#lights_on(5) == [1, 4] # desired method output = an array containing the number of the lights that are still on
#lights_on(10) == [1, 4, 9]

# Data:
# Input:
#    > "n" = the number of switches/lights = the number of repetitions of lightswitch toggling
#    > assumption I'm making: the inputted number will always be a positive integer >= 1, so inputs do not need to be validated

# Output:
#    > an array containing the number of the light that stills on after the completion of "n" rounds of lightswitch toggling


# Algorithm:
# 1. Create a hash with key numbers that range from 1 to the number passed into the method; all values should be the string value "off"
# 2. Initialize an index variable initially assigned to the value 0
# 3. Create a loop construct, within each iteration:
#      i. add 1 to the index variable
#      ii. iterate through each key/value pair of the hash and check if each key in the hash is divisible w/o a
#           remainder by the index variable's current value
#      iii. if the key value is divisible w/o a remainder by the index, then toggle the key's corresponding value to either "on" or "off"
#             > if the value corresponding with the key is currently "off" then toggle it to be reassigned to the string "on"
#             > if the value corresponding with the key is currently "on" then toggle it to be reassigned to the value "off"
#      iv. break out of the loop if the index's value = the number initially inputted into the method (this means that all desired repetitions
#          of toggling lightswitches have been completed)
# 4. select all the keys who have corresponding values equivalent to "on"
# 5. return all the keys from step 4. in an array

# Code:
def create_switches_hsh(n)
  lights_hsh = {}
  n.times do |x|
    lights_hsh[(x + 1)] = "off"
  end
  lights_hsh
end

# check that create_switches method works as intended:
p create_switches_hsh(5)
# => {1=>"off", 2=>"off", 3=>"off", 4=>"off", 5=>"off"}

def select_on_from_hsh(lights_hash)
  lights_hash.select do |key, value|
    value == "on"
  end.keys
end

def lights_on(n)
  lights = create_switches_hsh(n)
  index = 0
  loop do
    index += 1
    lights = lights.each_with_object({}) do |k_v_pair_arr, new_hsh|
      if k_v_pair_arr[0] % index == 0 && k_v_pair_arr[1] == "off"
        new_hsh[k_v_pair_arr[0]] = "on"
      elsif k_v_pair_arr[0] % index == 0 # value must be "on" then, so toggle it to "off"
        new_hsh[k_v_pair_arr[0]] = "off"
      else # all instances where remainder when divide by index != 0 get evaluated by this branch
           # so push the key value pair as is to the new lights hash, since this light isn't toggled
           # during this round
        new_hsh[k_v_pair_arr[0]] = k_v_pair_arr[1]
      end
    end
    break if index == n
  end
  select_on_from_hsh(lights)
end

# Check work:
p lights_on(5) == [1, 4]
# => true
p lights_on(10) == [1, 4, 9]
# => true

# Further Exploration Part 1:
# Change the output of the method to print which lights are on and which lights are off with each round
# Example:
# light_switching(5)) 
# => round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, and 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
def select_off_from_hsh(lights_hash)
  lights_hash.select do |key, value|
    value == "off"
  end.keys
end

def off_arr_to_string(arr_of_nums)
  off_str = ""
  if arr_of_nums.size == 1
    off_str << "light #{arr_of_nums[0]} is now off;"
  else
    off_str << "lights "
    arr_of_nums.each do |num|
      if arr_of_nums.index(num) == (arr_of_nums.size - 1)
        off_str << "and #{num} are now off;"
      else
        off_str << "#{num}, "
      end
    end
  end
  off_str
end

def on_arr_to_string(arr_of_nums)
  on_str = ""
  if arr_of_nums.size == 1
    on_str << "#{arr_of_nums[0]} is on"
  else
    arr_of_nums.each do |num|
      if arr_of_nums.index(num) == (arr_of_nums.size - 1)
        on_str << "and #{num} are on"
      else
        on_str << "#{num}, "
      end
    end
  end
  on_str
end

# check off_arr_to_hsh and on_arr_to_hsh created methods:
puts "#{off_arr_to_string([2, 4])} #{on_arr_to_string([1, 3, 5])}"
# => lights 2, and 4 are now off; lights 1, 3, and 5 are on

def light_status(lights_hsh)
  if lights_hsh.values.all?("on")
    "every light is turned on"
  elsif lights_hsh.values.all?("off")
    "every light is turned off"
  else
    "#{off_arr_to_string(select_off_from_hsh(lights_hsh))} #{on_arr_to_string(select_on_from_hsh(lights_hsh))}"
  end
end

def toggling_switches(n)
  lights = create_switches_hsh(n)
  index = 0
  loop do
    index += 1
    lights = lights.each_with_object({}) do |k_v_arr, hsh|
      if k_v_arr[0] % index == 0
        k_v_arr[1] == "off" ? hsh[k_v_arr[0]] = "on" : hsh[k_v_arr[0]] = "off"
      else # all instances where remainder when divide by index != 0 get evaluated by this branch
           # so push the key value pair as is to the new lights hash, since this light isn't toggled
           # during this round
        hsh[k_v_arr[0]] = k_v_arr[1]
      end
    end
    puts "round #{index}: #{light_status(lights)}"
    break if index == n
  end
end

# check return value of toggling_switches is as intended:
toggling_switches(5)
# => round 1: every light is turned on
# round 2: lights 2, and 4 are now off; 1, 3, and 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2, and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1, and 4 are on

# Further Exploration Part 2:
# rewrite the lights_on method (and underlying methods), so that each light and its
# on/off value are stored in an array instead of a hash
def create_switches_arr(n)
  lights_arr = []
  n.times do |x|
    lights_arr << [(x+1), "off"]
  end
  lights_arr
end

# check that create_switches method works as intended:
p create_switches_arr(5)
# => [[1, "off"], [2, "off"], [3,"off"], [4,"off"], [5, "off"]]

def select_on_from_arr(lights_arr)
  lights_arr.each_with_object([]) do |sub_arr, new_arr|
    new_arr << sub_arr[0] if sub_arr[1] == "on"
  end
end

def lights_on_arr(n)
  lights = create_switches_arr(n)
  index = 0
  loop do
    index += 1
    lights = lights.each_with_object([]) do |sub_arr, new_arr|
      if sub_arr[0] % index == 0
        sub_arr[1] == "off" ? new_arr << [sub_arr[0], "on"] : new_arr << [sub_arr[0], "off"] 
      else # all instances where remainder when divide by index != 0 get evaluated by this branch
           # so push the key value pair as is to the new lights hash, since this light isn't toggled
           # during this round
        new_arr << sub_arr
      end
    end
    break if index == n
  end
  select_on_from_arr(lights)
end

# Check work:
p lights_on_arr(5) == [1, 4]
# => true
p lights_on_arr(10) == [1, 4, 9]
# => true
