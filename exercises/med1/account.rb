# Is the BankAccount class missing an @ reference in the positive_balance
#  instance method?
class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# No, an @ is not missing, because a getter method has been
#  defined for the balance instance variable by the usage of
#  attr_reader :balance. So, the positive_balance? instance method
#  has been defined in a way that will compare the @balance instance
#  variable's value and 0.
