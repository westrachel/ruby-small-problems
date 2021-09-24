# Create a CircularQueue class that:
#   i. upon initialization accepts an integer argument specifying
#       the size of the buffer
#   ii. includes an enqueue method that allows for an object to
#         be added to the queue
#   iii. includes a dequeue method that removes and returns the
#         oldest object in the queue; it should return nil if
#         the queue is empty
#   iv. assume none of the values stored in the queue are nil
#   v. the test cases should print true 15x

# Data storage:
#    > an array is an ordered list and could be used as collection
#       holder for objects added and removed
#    > If just using Array#push to add elements, then the oldest object
#       in the collection will be the item at the zeroth index
#    > upon initialization can create a queue that points to an empty array
#       and can have an instance variable that tracks the max_size the queue
#       should be
#    > when invoking enqueue, will need to check if the array queue's size is
#       already equal to the maximum size, b/c if it is, then will need to
#       invoke dequeue to ensure the desired behavior is being modeled in that
#       you cannot add to a circular queue when it is at its size capacity
#   > the Array#shift method is mutating and wll remove the element at
#      the zeroth index of the array, so can leverage this method
#      for the dequeue method; nil will be returned if shift is called
#      on an empty array, which is the desired return value of dequeue
#      when there are no elements left to be removed
#   > I could technically initialize the queue array to store enough nils to
#      make the array's size equal to that of the maximum size, but that
#      would add extra logic requirements to make the queue work as desired
# Example: 
#
#                                | What queue array looks like if initialize
#             Code:              | it to store max size amount of nils
#   _____________________________|_____________________________________
#   queue = CircularQueue.new(3) |  [nil, nil, nil]
#   puts queue.dequeue == nil    |  [nil, nil]
#   queue.enqueue(1)             |  [nil, nil, 1]
#   queue.enqueue(2)             |  [nil, 1, 2]
#   puts queue.dequeue == 1      |  [1, 2]

#   The last line above would return false, b/c nil would be returned rather
#    than 1 (if no additional logic is added) even though 1 is the oldest
#    non-nil object to be removed

class CircularQueue
  attr_accessor :queue, :max_size
  def initialize(queue_limit)
    @queue = []
    @max_size = queue_limit
  end

  def dequeue
    queue.shift
  end

  def enqueue(addend)
    dequeue if queue.size == max_size
    queue.push(addend)
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil
# => true

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1
# => true

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2
# => true

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
# => true
puts queue.dequeue == 6
# => true
puts queue.dequeue == 7
# => true
puts queue.dequeue == nil
# => true

queue = CircularQueue.new(4)
puts queue.dequeue == nil
# => true

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1
# => true

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2
# => true

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
# => true
puts queue.dequeue == 5
# => true
puts queue.dequeue == 6
# => true
puts queue.dequeue == 7
# => true
puts queue.dequeue == nil
# => true