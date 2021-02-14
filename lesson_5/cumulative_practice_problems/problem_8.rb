hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# all strings = lowercased, so don't have to worry about downcasing or adding uppercase vowels to the VOWELS constant
VOWELS = ['a', 'e', 'i', 'o', 'u']

# write code to output all the vowels from the strings
vowels = hsh.values.map do |array|
  array.map do |string_element|
    string_element.chars.select do |letter|
        VOWELS.include?(letter)
    end
  end
end

# check work
puts vowels
