words = "the flintstones rock"

# create a method that capitalizes every word in the string like a title

def titlelize(str)
  arr = str.split.each do |word|
    word.capitalize!
  end
  arr.join(" ")
end

# check work:
p titlelize(words)

# alternative solution that chains methods for efficiency:
words.split.map { |word| word.capitalize }.join(' ')
