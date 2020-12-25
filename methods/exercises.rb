#Exercise 1:
def greeting(name="yoda")
  puts "Hey " + name + "! How's it going?"
end 

greeting()
greeting("chewbacca")

#Exercise 2:
# (i) x = 2                            <=> should return 2 
# (ii) puts x = 2                      <=> will print 2 but return nil
# (iii) p name = "Joe"                 <=> will print Joe and also return Joe
# (iv) four = "four"                   <=> will return four as a string 
# (v) print something = "nothing"      <=> I think this will return an error bc something isn't defined yet.... not 100% sure about this expectation 
         ## print something = "nothing"     returns nothing => nil 
        
        
#Exercise 3:
def multiply(x, y)
  x * y 
end 

multiply(4,5)


#Exercise 4: 
def scream(words)
  words = words + "!!!!"
  return 
  puts words 
end 

scream("Yippeee") #this won't print anything because return prevents the puts line from executing


 #Exercise 5:
 def scream(words)
  words = words + "!!!!"
  puts words 
end 

scream("Yippeee") #This will print Yippeee!!!!, but will return nil b/c puts returns nil 
## and puts is the last line executed, which is what ruby returns 

#Exercise 6
#this error message indicates that you're working out of a temporary irb session in the terminal
## and that you've passed an inccorect # of arguments into the calculate+product method 
## specifically it says (1 for 2), which I think means that you've only entered in 1 argument 
#when you needed to enter 2
#this implies that the calculate_product method doesn't have a default value for either of its
# parameters, bc if it did, then you wouldn't need to supply 2 arguments
 