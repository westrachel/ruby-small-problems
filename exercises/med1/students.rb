# Through adding/changing only a few lines, change initialize
#  methods in graduate and Undergraduate so that:
#  i. Grad students can use on-campus parking, but Undergrads cannot
#  ii. Grad and Undergrad students both have a name and year associated with them

# Edits:
#  > Make graduate and undergraduate classes inherit from Student by adding < Student
#     to their class NameOfClass lines
#  > Add super(name, year) to the body of the Graduate class
#  > Add the instance variable @parking to the body of hte Graduate's intialize method
#     definition
#  > Remove the initialize method from the Undergraduate class, b/c it's not necessary
#    now that Undergraduate is inheriting from Student (its initialize method was the same
#    as that of Student) <=> this edit technically changes more lines than an edit that only
#    adds super to the body of the Undergradate's initialize method, but since the initialize
#    methods were built the same, it seems redundant to keep them both

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end