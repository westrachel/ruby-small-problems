def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # != 'HEY YOU'

# Explain the above:
# > the name.chars method call returns a new array object that contains all
#      the individual characters of the passed in as an argument
# > then, the each method is called on the new array of characters and each
#    character is iterated over and uppercased
# > after all iterations w/in the each block are completed, the each method call
#     returns the original unchanged array
# > through the process of the above steps, none of the characters in the passed in string
#     are permanently uppercased/mutated
# > that's why the output is 'HEY you' and not 'HEY YOU'


# Code Edit so that method mutates the passed in argument:
# part 1:
def shout_out(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out('you')
