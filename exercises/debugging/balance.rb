# Why is the initial actual output: $80 withdrawn. Total balance is $50 for the program below?

# BankAccount#withdraw method only checks if the amount argument is greater than zero. Since
#  80 is greater than zero, the next line evaluated is: 
#  success = (self.balance -= amount). At that point in the program, self.balance points to 50 and
#  80 subtracted from 50 is -30. -30 will evaluate as truthy within the second if conditional
#  statement within the #withdraw method, because numerical vaues evaluate as true in Ruby. As a
#  result, the interpolated string "$80 is withdrawn" will be printed. The balance instance variable
#  doesn't get reassigned to -30 though, as shown in the actual output, because of the BankAccount#balance
#  method, which prevents the balance instance variable from getting reassigned to a new_balance if
#  the new_balance is not at a minimum 0. One way to resolve is to change the #withdraw method.
#  The first if statement's conditional within the if branch could be changed to check if the value the
#  amount argument references is less than or equal to the current balance.

class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    # old/initial first if statement:
    #if amount > 0
    #  success = (self.balance -= amount)
    #else
    #  success = false
    #end

    if amount <= self.balance
      success = (self.balance -= amount)
    else
      success = false
    end

    if success
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    if valid_transaction?(new_balance)
      @balance = new_balance
      true
    else
      false
    end
  end

  def valid_transaction?(new_balance)
    new_balance >= 0
  end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50

# check balance reassignment when large values greater than the
#   current balance are subtracted
p account.balance -= 10000 # => -9950
p account.balance         # => 50

p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
                          # Actual output: $80 withdrawn. Total balance is $50.
p account.balance         # => 50