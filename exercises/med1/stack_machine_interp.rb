# Create a class that implements a miniature stack-and-register
#  based programming language that has the following commands:

# n     = Place a value n in the "register". Don't modify the stack
# PUSH  = push the register value on to the stack. Leave the value in
#          the register.
# ADD   = remove value from the the stack, add it to the register value,
#          and store the result in the register
# SUB   = remove value from the stack, subtract it from the register value,
#          and store result in the register
# MULT  = remove value from the stack, multiply it w/ the register value,
#          and store the result in the register
# DIV   = remove value from stack, divide it into the register value, store
#          the result in the register
# MOD   = remove value from stack, divide it into the register value, and
#          then store the remainder of the division in the register
# POP   = remove most recently added value from the stack and put in
#          the register
# PRINT = display register value

# Requirements:
#  > Initialize the register to 0
#  > All operations are integer operations
#       <=> based on this, I can validate/check for a number by converting it to
#           an integer and then back into a string and examining whether that
#           converted value is the same as the initial string value, as it will
#           be equivalent for integers
#  > Actions that use 2 values remove and us the value added most recently to
#     the stack and the register; the result of the performed action is stored
#     as the register value

# Notes:
#  > Looking at the test cases, all commands entered upon initialization have
#     spaces between the string integers and the word commands, so can split
#     the command to parse it
#  > Reflecting back on my previous non-object oriented stack machine
#     interpreter Ruby method definition, the case statement used to
#     complete different tasks depending on the command could be refactored
#     further if object#send is used
#       > Based on Object#send Ruby docs you can pass in a Ruby method
#          as an argument alongside a value to be called on a different Ruby
#          object
#       > I could then establish a Ruby Hash and pair up the word command
#          arguments and their corresponding Ruby method in symbol form
#           <=> it doesn't look like I can establish a key/value pair that
#            chains methods
#           > For example, for my hash constant, it's not valid to write out
#               'ADD' => :+=, but 'ADD' => :+ is valid
#              > To workaround this, I can specify that register should be
#                 reassigned to the return value of sending/invoking a method
#                 on the current register value with the topmost stack value
#                 passed in as an argument to the method invocation
#           > It also doesn't appear to be valid to store the custom print
#              method as a key/value pair, so I can add that call as a different
#              when branch conditional to the case statement for instances when
#              the command being parsed is equal to 'PRINT'
#        > For case statements, it is actually possible to test if the value is
#           included within a numerical range
#            > Initially thought of using task.is_a?(Integer) in the when branch
#                 of the case statement, but that's not compatible with how
#                 case statements evaluate branches using ===
#            > Instead, can actually include the numerical range desired to
#                check the value as being included in
#              > in this case just want to test if the parsed task is not a
#                 string/is an integer, which can do by referencing negative
#                 infinity and positive infinity through calling existing
#                 infinity constants already defined in the Float class
#         > Looking at more docs, it's actually possible to also test if the
#             case statement's value is a key in a constant hash because of
#             Proc#===
#             > so I can store the value of the case statement's first line
#                and pass that in as an argument to the include?() method
#                invocation that's called on the array of keys returned from
#                invoking SOME_COMMANDS.keys
#  > One of the test cases calls an undefined command ('XSUB') and stops
#      execution, so that the subsequent print call is not invoked after parsing
#      the invalid command
#     > I'm currently choosing to invoke a new CustomError object and print a
#        simple message when an unexpected command is included in the
#        argument passed into the Minilang initialization
#     > this choice means that if PRINT were called before the invalid command,
#        that print call would be executed, which should seems reasonable given
#        there is no test case to suggest that is an invalid approach

require 'pry'
class Minilang
  attr_accessor :register, :stack
  attr_reader :command

  SOME_COMMANDS = {
    'ADD' => :+,
    'SUB' => :-,
    'MULT' => :*,
    'DIV' => :/,
    'MOD' => :%
  }

  def initialize(command)
    @register = 0
    @command = command.split(' ')
    @stack = []
  end

  def parsed_command
    command.map do |word|
      word.to_i.to_s == word ? word.to_i : word
    end
  end

  def print
    puts register
  end

  def top_stack_value
    stack.pop
  end

  def reassign_register(value)
    @register = value
  end

  def complete(task)
    @register = register.send(SOME_COMMANDS[task], top_stack_value)
  end

  # using Object#send to make case statement more concise
  def derive_response(task)
    case task
    when (-Float::INFINITY)..(Float::INFINITY) then reassign_register(task)
    when 'PUSH' then @stack << register
    when 'POP' then reassign_register(top_stack_value)
    when 'PRINT' then print
    when ->(key) { SOME_COMMANDS.keys.include?(key) } then complete(task)
    else CustomMachineInterpError.new(task)
    end
  end

  def eval
    parsed_command.each do |item|
      result = derive_response(item)
      break if result.class == CustomMachineInterpError
    end
  end
end

class CustomMachineInterpError < StandardError
  def initialize(invalid_command)
    puts "Invalid token: #{invalid_command}"
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PRINT').eval
# 5

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
#
# should return blank

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval # nothing printed
