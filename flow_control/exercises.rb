#Exercise 1:
# (32 * 4) >= 129     this should return false, b/c 32 * 4 is 128
# false != !true.     this should return false, !true = false and false != false 
#true == 4            this should return false, b/c 4 is not equal to true, although 4 does evaluate as true
# false == (847 == '874')  this should return true, b/c the value in the parenetheses is false
# (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false
      ## expecting this to return true based on breaking down this nested expression
      ## !true  is false 
      ## (!20 == 20) is false 
      ## 82 == 82 is true 
      ## so, this expression can be simplified to 
      ##  false OR false OR true OR false, which will return true 
      

#Exercise 2:
def capitalize_me(string)
  if string.length.to_i > 10 
    string = string.upcase
    puts string 
  else 
    puts string
  end
end

capitalize_me("Happy Holidays. Here's to making 2021 better than 2020")
capitalize_me("hi there")

#Exercise 3:
puts "Enter a number between 0 and 100"
num = gets.chomp.to_i

if num < 0
  puts "Error. Please enter a number between 0 and 100"
elsif num <= 50 
  puts "Your number is between 0 and 50"
elsif num <= 100
  puts "Your number is greater than 50, but less than 100"
else 
  puts "Your number is greater than 100"
end

#Exercise 4 predict the output:
# Snippet 1--
#'4' == 4 ? puts("TRUE") : puts("FALSE")
#should print false, string != integer

# Snippet 2
#x = 2
#if ((x * 3) / 2) == (4 + 4 - x - 3)
#  puts "Did you get it right?"
#else
 # puts "Did you?"
#end

# ( 3 ) == ( 3 )
# this should print "Did you get it right?"

# Snippet 3
#y = 9
#x = 10
#if (x + 1) <= (y)
#  puts "Alright."
#elsif (x + 1) >= (y)      #this should print "Alright now!"
#  puts "Alright now!"
#elsif (y + 1) == x
#  puts "ALRIGHT NOW!"
#else
#  puts "Alrighty!"
#end

#Exercise 5:
# bugged code:
#def equal_to_four(x)
#  if x == 4
#    puts "yup"
#  else
#    puts "nope"
#end

#equal_to_four(5)

#this code is missing an 'end'; the if ... else.. statement needs an end 
##   to denote its completion and the method definiition also needs an end

#fix it:
def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
  end
end
equal_to_four(5)

#Exercise 6:

#(32 * 4) >= "129"   #should return an error b/c this is trying to compare an integer to a string
  #yep: specifically get an ArgumentError 
#847 == '874'        should return: false, integer != string
#'847' < '846'       should return: false, 7 is not < 6
#'847' > '846'       should return: true, 7 > 6
#'847' > '8478'      should return: false b/c 847 is shorter than 8478, and once ruby recognies that
                     #through comparing each character one by one, ruby will view the string 847 as less than the string 8478
#'847' < '8478'      #should return: true