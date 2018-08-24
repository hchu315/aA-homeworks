class Stack
    def initialize
      @some_stack = []
      # create ivar to store stack here!
    end

    def push(el)
      @some_stack << el
      # adds an element to the stack
    end

    def pop
      @some_stack.pop
      # removes one element from the stack
    end

    def peek
      @some_stack.last
      # returns, but doesn't remove, the top element in the stack
    end
  end

class Queue
  def initialize
    @some_queue = []
  end

  def enqueue(el)
    @some_queue << el
  end

  def dequeue
    @some_queue.shift
  end

  def peek
    @some_queue.first
  end
#follow FIFO principle
end

#Exercise 3 - Map
# As you saw in the videos for tonight, a map can be implemented using a 2D array.
# Let's write a Map class (following a similar pattern to Stack and Queue) that implements
# a map using only arrays.
#
# Remember, a map stores information in key-value pairs, where the keys are always unique.
# When implemented with arrays, a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].
#
# Our Map class should have the following instance methods: set(key, value), get(key), delete(key), show.
# Note that the set method can be used to either create a new key-value pair or update the value for a pre-existing key.
# It's up to you to check whether a key currently exists!
#
# As always, test your code thoroughly to make sure all properties of maps are enforced.
class Map
  def initialize
    @map_obj = []
  end

  def set(k,v)
    indice = @map_obj.index { |el| el[0] == k}

    if indice
      @map_obj.each do |subarr|
        if subarr[0] == k
          subarr[1] = v
        end
      end
    else
      @map_obj << [k, v]
    end
  end

  def get(k)
    @map_obj.each { |el| return el[1] if el[0] == k}
    nil
  end

  def delete(k)
    val = get(k)
    @map_obj.select! { |el| el[0] != k}
    val
  end

  def show
      @map_obj.flatten
  end
end
