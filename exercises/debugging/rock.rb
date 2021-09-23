# When the API_KEY is set to a wrong value, as in the case below,
#  why is the defined error message: 'API key is not valid' not
#  displayed?

# In the first method invocation of find_out, 'Sushi' is passed
#  in as the argument. Within the find_out method, the local
#  variable score is initialized to point to the return value of
#  passing in the same argument of the find_out method invocation
#  to the method for_term. So, 'Sushi' is passed into for_term
#  method invocation.

# Subsequently, two local variables positive and negative are
#  intialized to point to the return values of passing in a string
#  that incorporates the 'Sushi' string argument via string
#  interpolation and the API_KEY constant to the SearchEngine's
#  class count method. The API_KEY constant has been defined for the
#  DoesItRock module as a key that's different than the intended key of
#  'LS1A', which is defined in the SearchEngine class's valid? method.
#  When the count method is called an AuthenticationError will be raised,
#  because the DoesItRock API_KEY constant, 'LS', will be compared against
#  the intended API_KEY 'LS1A' and will return false triggering an
#  AuthenticationError based on the unless loop logic defined within
#  SearchEngine's count method.

# The for_term method has been defined to handle exceptions, and since
#  the positive and negative local variables won't be initialized to point
#  to actual floats as AuthenticationErrors are raised instead, the program
#  will be rescued and return the NoScore class instead, which is what the local
#  variable score will point to within the find_out method invocation. The
#  case statement will subsequently always evaluate the else clause branch and
#  always return a String that's a concatenation of the argument passed into
#  find_out and the String 'rocks!'. This is because none of the when clauses in
#  the case statement will evaluate as true. The local variable score doesn't
#  point to a float so the 2nd and 3rd when clauses of the case statement can't
#  evaluate as true. The first when NoScore clause doesn't evaluate as true
#  either b/c the score variable isn't an instance object of the NoScore class.

class AuthenticationError < Exception; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

      positive / (positive + negative)
    rescue Exception
      NoScore
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue Exception => e
    e.message
  end
end

# Example
puts DoesItRock.find_out('Sushi')
puts DoesItRock.find_out('Rain')
puts DoesItRock.find_out('Bug hunting')
