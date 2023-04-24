#bonuse features:
# 1. better integer validation 
# updated valid_number? definition below for better integer validation with the acceptance of extraneous characters at the end of the inputted number
# 2. number validation
# verify that only valid numbers (integers or floats are entered) through defining new number? method
# 3. operation_to_message
# modified operation_to_message to stop relying on the case statement being the last expression in the method
# 4. extracting messages in the program to a configuration file
# 5. internationalize your calculator's messages

require 'yaml'
MSGS = YAML.load_file('messages.yml')
#puts MSGS.inspect
#puts MSGS['english']['welcome']

def msg_lang(message, language='english')
  MSGS[language][message]
end


def valid_number?(str_input)
  # invalid numbers are strings that start with characters other than string numbers or the string negative symbol and then a string number after the string negative symbol
  # the calculator will accept "2a" as a valid number, as .to_f and .to_i will disregard the "a" at the end and only keep the 2
  # based on the above property of to_f and to_i, only need to check the string's first and second elements for string number values
  # have altered the number input code below to not immediately convert the user's inputted number to .to_i or .to_f
  acceptable_first_str_elements = %w(0 1 2 3 4 5 6 7 8 9 10)
  if acceptable_first_str_elements.include?(str_input[0]) 
    true 
  elsif str_input["-"]
    acceptable_first_str_elements.include?(str_input[1]) 
  else 
    false
  end
end

def prompt(message)
  puts "=> #{message}"
end

def float?(str_input)
  str_input.to_f.to_s == str_input
end

def integer?(str_input)
  str_input.to_i.to_s == str_input
end

def number?(str_input)
  integer?(str_input) || float?(str_input)
end

def operation_to_message(op)
  gerund_to_print = case op 
                    when '1'
                      'Adding'
                    when '2'
                      'Subtracting'
                    when '3'
                      'Multiplying'
                    when '4'
                      'Dividing'
                    end
  # 7 + 8  if did not comment this out, then no matter what operation the user chooses, the printed value would be "15 the two numbers"
  # that would be true if I didn't store the case statement to a new variable and list that variable at the end of the case statement
  7 + 8 
  gerund_to_print
end

prompt(msg_lang('welcome'))
prompt(msg_lang('name'))

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(msg_lang('name'))
  else
    break
  end
end

prompt("Hi #{name}")

loop do # main loop
  num1 = ''
  loop do
    prompt(msg_lang('first_num'))
    num1 = gets.chomp

    if number?(num1)
      num1 = num1.to_f
      break
    else
      prompt(msg_lang('invalid_num'))
    end
  end

  num2 = ''
  loop do
    prompt(msg_lang('second_num'))
    num2 = gets.chomp

    if number?(num2)
      num2 = num2.to_f
      break
    else
      prompt(msg_lang('invalid_num'))
    end
  end

  prompt(msg_lang('operation_prompt'))

  operation = ""
  loop do
    operation = gets.chomp

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt(msg_lang('enforce_choice'))
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  result = case operation
           when '1'
             num1 + num2
           when '2'
             num1 - num2
           when '3'
             num1 * num2 
           when '4'
             num1 / num2
           end

  prompt(msg_lang('result') + " #{result}")

  prompt(msg_lang('exit'))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(msg_lang('goodbye'))
