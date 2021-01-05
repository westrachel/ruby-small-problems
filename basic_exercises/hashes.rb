#1. First Car
#create a hash with the given car info 
car = {type: "sedan", 
  color: "blue",
  mileage: 80_000
}

#2. Adding the Year
#add the key :year and the value 2003 to car 
car[:year] = 2003

#3. Broken Odometer
#delete the :mileage key and its associate value from car 
car.delete(:mileage)


#4. What Color?
#select the value blue from the car hash and print it w/ puts
puts "#{car[:color]}"

#5. Labeled Numbers
#use each to iterate over numbers and print each element's key/value pair
numbers = {
  high:   100,
  medium: 50,
  low:    10
}
#expect output:
#A key number is value 
numbers.each do |key, value|
  puts "A #{key} number is #{value}."
end 

#6. Divided by Two 
#use Enumerable#map to iterate over numbers and return an array containing each number divided by 2
#assign the returned array to a variable named half_numbers and print its value using #p 
half_numbers = numbers.map {|key, value| 
  value / 2
}

p half_numbers


#7. Low, Medium, or High?
#use select to iterate over numbers and return a hash containing only key-value pairs where the value is less than 25
#assign the returned hash to a variable named low_numbers 
#print it using p
low_numbers = numbers.select {|key, value|
  value < 25 
}
p low_numbers

#8. Low or Nothing
numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select! do |key, value|
                 value < 25
               end
#have created an alias, as both numbers and low_numbers point to the same hash

p low_numbers
p numbers

#9. Multiple Cars
#create a nest hash using the given info
car = {type: "sedan", 
  color: "blue",
  year: 2003
}

truck = {type: "sedan", 
  color: "blue",
  year: 1998
}

vehicles = Hash.new
vehicle[:car] = car
vehicle[:truck] = truck 
p vehicles 


#10. Which Collection?
#rewrite car as a nested array containing the same key-value pairs 
car = {
  type:  'sedan',
  color: 'blue',
  year:  2003
}
car = [[type: 'sedan'], [color: 'blue'], [year: 2003]]