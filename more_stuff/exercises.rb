#Exercise 1
#check if "lab" sequence of characters exists in the following strings
# if it does, print out the word
#first attempt:
#def lab_check(string)
 # if /lab/.match(string)     #can't just use .match on string alone, b/c it will only look for lab in the first word of the string
#   puts "#{string}"
 # else
  #  puts "lab is not in the specified word"
  #end
#end

#second attempt
# allow for multiple words to be checked for lab
#diagnose what happens to string when use split method
#def lab_check(string)
#  string = string.split
#  if string.is_a?(Array)
#   puts "#{string}"       #string input is converted into an array when use split method
#  end
#end

#now that I know split turns string into array, use .each on array to check each element of the array for lab 
#if set up program this way, then should be able to get program to print labyrinth unlike the first attempt
#def lab_check(string)
#  string = string.split
#    string.each do |array_element|
#      if /lab/ =~ array_element
#       puts "#{array_element}"
#      end 
#   end
#end
## pans labyrinth doesn't return still in the second attempt. Actually, I think I've misdiagnosed what I need to do 
## based on the assumption that case sensitivity doesn't matter, but it does matter
## the question doesn't specify if I should be case sensitive or not 
## put differently, the question doesn't specify if the word should be printed if /Lab/ is in it or /lab/ 
## my programs written so far only check for lab (lowercase l)
## if test /lab/ =~ "pans Labyrinth" in irb, it returns nil, so the first program I wrote above actually works just fine 
## for the exercise's request
## but I'm going to modify that and "puts" out strings that contain either lab or Lab
def lab_check(string)
  if /lab/.match(string)    
     puts "#{string}"
  elsif /Lab/.match(string)
     puts "#{string}"
  else
  end
end

lab_check("laboratory")
lab_check("experiment")
lab_check("Pans Labyrinth")
lab_check("elaborate")
lab_check("polar bear")


#Exercise 2:
#what does the following program print to the screen?
#what will it return?

def execute(&block)
   block
end

execute { puts "Hello from inside the execute method!" }
#I don't think anything should be printed b/c there's no call method 
# specifically, if wanted something to be printed should define the method as:
def execute(&block)
  block.call
end 
#the method will return a proc object

#exercise 3:
#what is exception handling and what problem does it solve?
# exception handling is code that tells a program what to do 
# when it encounters an error or an undesired result 
# the errors/undesired results stem from the fact that programs 
# are built to allow for user inputs and users may try to input things
# that either purposefully or on accident don't match up with what is
#desired for the inputs
# exception handling solves the problem of your code exiting/halting 
# the entire program upon encountering an error/undesired result

#Exercise 4: 
#modify the code in exercise 2 to make it run properly
# oh, I think I already did that but let's write it out again for practice
def run(&block)
  block.call
end
 
run { puts "What up? Oh me? I'm just chilling out in the run method" }


#Exercise 5:
#why does the following code: (the #s in parenthesis are added to line up w/ the error message )
# (1) def execute(block)
# (2) block.call
# (3) end
# (4) 
#(5) execute { puts "Hello from inside the execute method" }

#give the following error:
#block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
#from test.rb:5:in `<main>'

# the error results from an incorrect argument in line 1 of the defined method
# specifically, the code is trying to define a method that calls a block, but the block argument isn't fully specified
# there is a missing ampersand & before the block in execute(block) in line 1
# so, couldn't execute line 5 of code