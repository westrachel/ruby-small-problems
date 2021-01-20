def request(info)
  puts "Please enter your #{info}"
end

def valid_to_two_decimals?(amt)
  if amt.include?(".") && amt != "" && amt.to_i > 0
    # ensure user doesn't input a dollar amount with nonsensical decimals
    amt.to_f.round(2).to_s == amt
  else
    amt.to_i.to_s == amt && amt != "" && amt.to_i > 0
  end
end

puts "Hello! Welcome to the Mortgage calculator."

request("loan amount.")
loan_amount = gets.chomp

until valid_to_two_decimals?(loan_amount)
  puts "That's not a valid loan amount. Enter your loan amount please."
  loan_amount = gets.chomp
end

request("Annual Percentage Rate (APR) as a whole number (ie 3.75 for 3.75%).")
annual_apr = gets.chomp

until valid_to_two_decimals?(annual_apr)
  puts "Hmm, that doesn't seem right. Please enter your APR."
  annual_apr = gets.chomp
end

request("loan duration in years.")
duration_in_yrs = gets.chomp

until valid_to_two_decimals?(duration_in_yrs)
  puts "That doesn't seem right.
        Please enter the total number of years of your loan."
  duration_in_yrs = gets.chomp
end

duration_in_months = duration_in_yrs.to_i * 12 * -1
monthly_interest_rate = annual_apr.to_f / 12 / 100
monthly_payment = (loan_amount.to_f *
                  (monthly_interest_rate / (1 -
                  (1 + monthly_interest_rate)**(duration_in_months)))).round(2)

mortgage_calc_result = <<-RESULT
  You're monthly payment is $#{monthly_payment} based on:
  Annual APR =  #{annual_apr}%
  Loan Amount = $#{loan_amount}
  Loan Duration = #{duration_in_yrs} years
RESULT

puts mortgage_calc_result
