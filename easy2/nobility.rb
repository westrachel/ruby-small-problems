# define a noble class that shows the title and name when walk is called

module Moveable
  def walk
    "#{self} " + gait + " forward"
  end
end


class Noble
  attr_reader :name, :title
  include Moveable

  def initialize(name, title)
    @name = name
    @title = title
  end
  
  def to_s
    "#{title} #{name}"
  end
  
  private 
  
  def gait
    "struts"
  end
  
end

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"
