# Why does invoking community_library.books.display_data raise an exception?

# The chained method invocations in question first calls the getter .books method on the
#  community_library Library object. The return of community_library.books is an
#  array of books objects. The display_data method is defined for Book instance objects,
#  but is not defined for an array object. The core Ruby library also doesn't have a method
#  #display_data defined for Array objects, so an exception is raised.

# To avoid raising an exception, the each method can be invoked with a block on the array object
#   that the books instance variable points to and within the block of the each method invocation,
#    the #display_data metho can be called individually on each book instance object.

class Library
  attr_accessor :address, :phone, :books

  def initialize(address, phone)
    @address = address
    @phone = phone
    @books = []
  end

  def check_in(book)
    books.push(book)
  end
end

class Book
  attr_accessor :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def display_data
    puts "---------------"
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "ISBN: #{isbn}"
    puts "---------------"
  end
end

community_library = Library.new('123 Main St.', '555-232-5652')
learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

community_library.check_in(learn_to_program)
community_library.check_in(little_women)
community_library.check_in(wrinkle_in_time)

# community_library.books.display_data   <=> raises an exception b/c Array#display_data doesn't exist as a method
# To avoid raising an exception, invoke the #display_data on each book instance object instead:
community_library.books.each { |book| puts book.display_data }
# ---------------
#Title: Learn to Program
#Author: Chris Pine
#ISBN: 978-1934356364
#---------------

#---------------
#Title: Little Women
#Author: Louisa May Alcott
#ISBN: 978-1420951080
#---------------

#---------------
#Title: A Wrinkle in Time
#Author: Madeleine L'Engle
#ISBN: 978-0312367541
#---------------