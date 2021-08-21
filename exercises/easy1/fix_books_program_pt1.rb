# Fix the Book class definition so that the following expected output is achieved:
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

class Book
  attr_reader :title, :author # need to add getter methods
  
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author}) 
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
# => The author of "Snow Crash" is Neil Stephenson.
puts %(book = #{book}.)
# => book = "Snow Crash", by Neil Stephenson.

# Further exploration q:
# (1) what other built-in ruby methods exist besides attr_reader and would you use them here?
#      > I did not use attr_writer or attr_accessor b/c a book's author and title are most likely static and don't need
#           to be publicly changed; therefore only care to include getter methods
# (2) could you have used the following getter methods defined? would something change?
#      > Yes, the defined getter methods below could be used, but they wouldn't result in anything different for the above example.
#            Since there isn't a need to enhance the getter methods to include more functionality, it's simpler to use the built-in
#            getter methods faciliated by attr_reader instead of individually defining them. 
def title
  @title
end

def author
  @author
end
