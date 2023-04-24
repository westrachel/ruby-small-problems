a = [1, 2, 3]

#example of a method definition that modifies its arguments permanently 
def mutate(array)
  array.pop
end

p "Before mutate method: #{a}"
mutate (a)
p "After mutate method: #{a}"

b = [1, 2, 3]

#example of a method definition that does not mutate the caller
def no_mutate(array)
  array.last
end 

p "Before no_mutate method: #{b}"
no_mutate(b)
p "After no_mutate method: #{b}"