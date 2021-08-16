# Edit the class definition so that the output for the 2 puts method invocations are:
# John Doe
# Jane Smith

class Person
  attr_writer :first_name, :last_name # needed to add setter methods
  
  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def to_s
    "#{@first_name.capitalize} #{@last_name.capitalize}" # assumed the stored instance variables
    #  didn't need to be capitalized, so just altered to the to_s method to achieve desired output
  end
end

person = Person.new('john', 'doe')
puts person
# => John Doe

person.first_name = 'jane'
person.last_name = 'smith'
puts person
# => Jane Smith 
