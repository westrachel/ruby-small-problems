# Part 1: Alter the Machine class to make the flip_switch and switch setter methods private
# Part 2: Add a private getter for the switch instance variable and add a method to be able to se the switch status

class Machine
  # attr_writer :switch

  def start
    # self.flip_switch(:on)    # My Ruby version is before 2.7 and doesn't allow for calling a private method on self
    flip_switch(:on)
  end

  def stop
    # self.flip_switch(:off)
    flip_switch(:off)
  end

  def display_status
    switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

light1 = Machine.new
light1.start
light1.stop
puts light1.display_status
# off