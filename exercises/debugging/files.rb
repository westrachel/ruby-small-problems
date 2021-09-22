# How can you fix the unitialized constant File::FORMAT NameError exception?

#  The FORMAT constant isn't initialized within the superclass, File, wich contains
#  the #to_s instance method that references the FORMAT constant. All subclasses that
#  inherit from the File superclass do define a FORMAT constant, and define their own
#   unique value for the FORMAT constant. In order to reference the intended FORMAT constant,
#   tt needs to be specifiedwhere to look for the FORMAT constant within the File#to_s instance
#   method. If if self.class:: is addeded right before the FORMAT mention within the File#to_s
#  instance method definition than the exception won't be raised.

class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post
