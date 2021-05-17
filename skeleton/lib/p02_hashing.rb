# Phase 2: Hashing
# Notes:
# Don't spend more than 20 minutes working on hashing functions. Great hashing functions are hard to write. Your goal is to write a good-enough hashing function and move forth to the fun stuff ahead! Call over a TA if needed.
# Avoid using byebug inside your hash methods. The functioning of byebug's internal code will cause this to break since it calls Array#hash.
# You may want to refer to the resource on XOR. Please read the intro and section about exclusive or (^ in Ruby). XOR is a great tool for hashing because it's fast, and it provides a good, nearly uniform output of bits.
# A hash function is a sequence of mathematical operations that deterministically maps any arbitrary data into a pre-defined range of values. Anything that does that is a hash function. However, a good hash function satisfies the property of being uniform in how it distributes that data over its range of values.

# To create a good hash function, we want to be able to hash absolutely anything. That includes integers, strings, arrays, and even other hashes.

# Also, a hash function should be deterministic, meaning that it should always produce the same value given the same input. It's also essential that equivalent objects produce the same hash. So if we have two arrays, each equal to [1, 2, 3], we want them both to hash to the same value.

# So let's construct a nice hashing function that'll do that for us. Be creative here!

# Write hash functions for Array, String, and Hash. Build these up sequentially.

# Use Integer#hash as a base hashing function. The trick here will be to create a scheme to convert instances of each class to a Integer and then apply this hashing function. This can be used on Numerics such as the index of an array element.
# Don't try to overwrite Ruby's native Integer#hash; making a hash function for numbers is something that's outside the scope of this assignment.
# Ordering of elements is essential to hashing an Array or String. This means each element in an Array or String should be associated with its index during hashing. Ex. [1, 2, 3].hash == [3, 2, 1].hash # => false
# On the other hand, ordering is not to be considered with a Hash. Hashes are based on sets and have no fixed order. Ex. {a: 1, b: 2}.hash == {b: 2, a: 1}.hash # => true
# Hints:
# Can you write String#hash in terms of Array#hash?
# When you get to hashing hashes: one trick to make a hash function order-agnostic is to turn the object into an array, stably sort the array, and then hash the array. This'll make it so every unordered version of that same object will hash to the same value.




class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash = {}
    (0...self.length).each do |i|
      hash[i] = i.hash
    end
    hash
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
