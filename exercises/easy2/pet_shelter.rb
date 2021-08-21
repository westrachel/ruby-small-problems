# Write the classes and methods so that the following prints out the expected output:
#P Hanson has adopted the following pets:
#a cat named Butterscotch
#a cat named Pudding
#a bearded dragon named Darwin

#B Holmes has adopted the following pets:
#a dog named Molly
#a parakeet named Sweetie Pie
#a dog named Kennedy
#a fish named Chester

#P Hanson has 3 adopted pets.
#B Holmes has 4 adopted pets.

class Pet
  attr_reader :type, :name

  def initialize(animal_type, name)
    @type = animal_type
    @name = name
  end
  
  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
  
  def new_pet(pet)
    @pets << pet
  end
  
  def number_of_pets
    pets.size
  end
  
  def print_pets
    puts pets
  end
end

class Shelter
  def initialize
    @adoption_list = {}
  end
  
  def adopt(owner, pet)
    owner.new_pet(pet)
    if @adoption_list.keys.include?(owner.name) == false
      @adoption_list[owner] = owner.pets
    end
  end
  
  def print_adoptions
    @adoption_list.each do |owner, _|
      puts "#{owner.name} has adopted the following pets:"
      owner.print_pets
      puts ""
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Kennedy
# a parakeet named Sweetie Pie
# a dog named Molly
# a fish named Chester
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# P Hanson has 3 adopted pets.
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
# B Holmes has 4 adopted pets.
