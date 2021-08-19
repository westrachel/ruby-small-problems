# Edit the following so that:
#   i. edit the code so that the if else statement actually prints something
#  ii. make the amount in the wallet accessible only to methods in the Wallet class

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end
  
  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end
  
  protected # add the getter method after private to satisfy condition ii
  attr_reader :amount # need to add a getter method to be able to read the wallet amount
  
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end
# => Bill has more money than Penny
