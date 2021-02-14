# write a method that returns a UUID when called w/ no parameters

# example of UUID:
# "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
# based on a web search, UUIDs should contain lowercase letters and can contain #s 0 through 9
# special characters like @ symbols or *'s among other special characters are not included

# create constant array that contains all acceptable characters to sample from when creating the UUID
CHARACTERS = "a".upto('z').to_a + %w(0 1 2 3 4 5 6 7 8 9)

def create_UUID
  str = ""
  8.times { |x| str << CHARACTERS.sample }
  str << '-'
  3.times do |x|
    4.times { |x| str << CHARACTERS.sample }
    str << '-'
  end
  12.times { |x| str << CHARACTERS.sample }
  str # make return value of the method call the UUID referred to by the variable str
end

puts create_UUID

# alternative solution:
def make_a_UUID
  uuid = ""
  sample_this_many_times_before_hyphenate = [8, 4, 4, 4, 12]
  sample_this_many_times_before_hyphenate.each do |number|
    number.times { uuid += CHARACTERS.sample }
    uuid += '-'
  end
  uuid.chop! # this removes the hyphen that gets added to the very end of the uuid
  uuid
end

puts make_a_UUID
