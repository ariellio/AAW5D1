require "byebug"
class MaxIntSet

    attr_reader :store
  def initialize(max)
      @store = Array.new(max, false)
      @max = max
  end

  def insert(num)
       if num > @max || num < 0
        raise "Out of bounds"
       else 
        @store[num] = true
       end 
  end

  def remove(num)
      @store[num] = false
  end

  def include?(num)
      @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
       self[num] << num
  end

  def remove(num)
      self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
     @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)  
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      self[num] << num
      @count += 1
    end 
    if @count > num_buckets
      resize!
    end 
  
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -=1
    end 
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # debugger
    @store[num % num_buckets]
  end

  def num_buckets
    # debugger
    @store.length
  end

  def resize!
    # debugger
        prev_store = @store 
        @store = Array.new(2 * prev_store.length) { Array.new }
        self.count = 0   
        prev_store.each do |sub_arr|
              sub_arr.each do |num|
              #  @store[num % @store.length]<< num
              insert(num)
              end
          end     
  end
end

# r = ResizingIntSet.new(4)
# p r 
# r.insert(1)
# r.insert(2)
# r.insert(3)
# r.insert(4)
# r.insert(5)
