# Given the following Greeting, Hello, and Goodbye classes, explain what
#  will happen in the following cases result in:
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# case 1:
hello = Hello.new
hello.hi
# Explanation:
# hello is instantiated as a new object of the Hello class, which inherits from
#  the Greeting class. When the hi instance method is invoked, the string object
#  "Hello" is passed in as an argument to the greet instance method that. Ruby first
#   looks for a greet instance method definition in the Hello class, and since it
#   doesn't find one there, it looks to the superclass, which comes next in the lookup
#   path. There is a greet method defined in the Greeting superclass, so the "Hello"
#   string object is passed into that as an argument and is subsequently passed into
#   the puts method invocation as an argument. Overall, the result is that "Hello" is
#   printed.

# case 2:
#hello.bye
# Result: a NoMethodError exception is raised. The Hello class does not have a bye
#   instance method defined nor does the Greeting class or any classes that exist
#   further up in the lookup path have one. If Hello had inherited from the Goodbye
#   class than it would inherit the defined bye instance method that exists in the
#   Goodbye class.

# case 3:
#hello.greet
# Result: A missing argument exception state will return. The Hello class inherits the
#  greet message from the Greeting class, which has defined the greet message to accept
#  1 argument. The parameter of the greet instance method isn't defined with a default
#  value, so when no argument is passed in, which is the case when hello.greet is
#  invoked, then there is an argument exception raised.

# case 4:
hello.greet("Goodbye")
# Result: Goodbye is printed. hello is an instance of the Hello class, which inherits
#   a greet instance method from the Greeting class. Tis greet instance method expects
#   1 argument, which is passed in in this case (the string "Goodbye"). Subsequently,
#    this argument gets passed in as an argument to the puts method invocation w/in the
#    body of the greet instance method.

# case 5:
#Hello.hi
# Result: NoMethoodError exception is raised, because there is no class method named
#  hi defined in the Hello class nor in the inherited from Greeting class nor in
#   the other classes of the lookup path. One cannot call an instance method (which is
#   what hi is) on the class Hello.

# define a class method:
class Hello < Greeting
  def self.hi
    puts "Hi"
  end
  
  def hi
    greet("Hello")
  end
end

Hello.hi # => Hi
