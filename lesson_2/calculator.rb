# ask user for 2 numbers
# ask user for an operation to perform
# perform that operation of the numbers inputted
# output the result

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num != 0 
end

def operation_to_message(op)
  case op 
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end
prompt("Welcome to this simple Calculator! Enter your name:")

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt("Enter a name, please.")
  else
    break
  end
end

prompt("Hi #{name}")

loop do # main loop
  num1 = ''
  loop do
    prompt("Enter the first number")
    num1 = gets.chomp.to_f

    if valid_number?(num1)
      break
    else
      prompt("That doesn't seem like a valid number...")
    end
  end

  num2 = ''
  loop do
    prompt("Enter the second number")
    num2 = gets.chomp.to_f

    if valid_number?(num2)
      break
    else
      prompt("That doesn't seem like a valid number...")
    end
  end

  operation_prompt = <<-MSG
    What operation do you want to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operation_prompt)

  operation = ""
  loop do
    operation = gets.chomp

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt("Must choose 1, 2, 3, 4")
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  # replace ifelse w/ case statement to avoid repetition
  result = case operation
           when '1'
             num1.to_i + num2.to_i
           when '2'
             num1.to_i - num2.to_i
           when '3'
             num1.to_i * num2.to_i
           when '4'
             num1 / num2
           end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate)}")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for using the calculator! Goodbye.")
