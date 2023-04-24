books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

# order the array of hashes based on the year of publication of each book, from earliest to latest

# select the published value:
# books[index][:published] <=> in the sort method call below, a and b refer to books[index] for all indices in the array

oldest_to_newest = books.sort do |a, b|
  a[:published] <=> b[:published]
end

# check work:
p oldest_to_newest

# simpler solution that achieves same result as the above:
books.sort_by do |book|
  book[:published]
end
