# Problem:
# Finish the banner class to create bordered messages
# Requirements:
#   > implementation details in the class shouldn't be public
#   > can assume input will always fit in the terminal window 
#      <=> so, no multi-line messages

class Banner
  def initialize(message)
      @message = message
      @msg_size = message.size
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+" + "-" * (@msg_size + 2) + "+"
  end

  def empty_line
    "|" + " " * (@msg_size + 2) + "|"
  end

  def message_line
    "| #{@message} |"
  end
end

# Test Cases for the Class:
banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# output:
#+--------------------------------------------+
#|                                            |
#| To boldly go where no one has gone before. |
#|                                            |
#+--------------------------------------------+

banner = Banner.new('')
puts banner
# output:
#+--+
#|  |
#|  |
#|  |
#+--+

# Further Exploration:
# Modify the banner class, so that new will optionally let you specify a fixed banner width
#  at the time the Banner object is created. The message in the banner should be centered within
#  the banner of that width. Decide how to handle widths that are either too narrow or too wide.

class Banner
  def initialize(message, width=0)
      @message = message
      @width = width
      @lines = []
  end

  def to_s
    [horizontal_rule, empty_line, message_lines, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+" + "-" * (@width) + "+"
  end

  def empty_line
    "|" + " " * (@width) + "|"
  end

  def message_lines
    index = 0
    until @message[index].nil?
      if @message[index, @width].size == @width
        @lines << "|" + "#{@message[index, @width]}" + "|"
      else
        @lines << "|" + "#{@message[index, @width]}" +  " " * (@width - @message[index, @width].size) + "|"
      end
      index += @width
    end
    @lines
  end

end


banner = Banner.new('To boldly go where no one has gone before.', 12)
puts banner
# Multiline output:
#+------------+
#|            |
#|To boldly go|
#| where no on|
#|e has gone b|
#|efore.      |
#|            |
#+------------+