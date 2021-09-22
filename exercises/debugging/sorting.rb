# Why does the following program raise an exception when sort is called?
require 'pry'
# The sort method invokes <=> on Length instance objects. The Length class
#  doesn't have a <=> method defined originally, so that method can't be called
#  with length class objects passed in as arguments. To fix this error, a unique
#  <=> method can be defined for the Length class that uses the existing conversion
#  methods to assist in the sorting process. The <=> method generally returns -1, 0, 1
#  when it's comparing 2 objects that can be compared, so when defining the <=> method
#  can use the Length's class existing comparison methods to return these specific values
#  when comparing distances with different units.

class Length
  attr_reader :value, :unit

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def as_kilometers
    convert_to(:km, { km: 1, mi: 0.6213711, nmi: 0.539957 })
  end

  def as_miles
    convert_to(:mi, { km: 1.609344, mi: 1, nmi: 0.8689762419 })
  end

  def as_nautical_miles
    convert_to(:nmi, { km: 1.8519993, mi: 1.15078, nmi: 1 })
  end

  # add <=> method for Length class objects:
  def <=>(other)
    case unit
    when :km  then value <=> other.as_kilometers.value
    when :mi  then value <=> other.as_miles.value
    when :nmi then value <=> other.as_nautical_miles.value
    end
  end

  def ==(other)
    case unit
    when :km  then value == other.as_kilometers.value
    when :mi  then value == other.as_miles.value
    when :nmi then value == other.as_nautical_miles.value
    end
  end

  def <(other)
    case unit
    when :km  then value < other.as_kilometers.value
    when :mi  then value < other.as_miles.value
    when :nmi then value < other.as_nautical_miles.value
    end
  end

  def <=(other)
    self < other || self == other
  end

  def >(other)
    !(self <= other)
  end

  def >=(other)
    self > other || self == other
  end

  def to_s
    "#{value} #{unit}"
  end

  private

  def convert_to(target_unit, conversion_factors)
    Length.new((value / conversion_factors[unit]).round(4), target_unit)
  end
end

# Exampple:
puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# initial error message:
# => comparison of Length with Length failed (ArgumentError)
# expected output:
# 1 km
# 1 mi
# 1 nmi