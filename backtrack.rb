# from http://blade.nagaokaut.ac.jp/~sinara/ruby/math/combinatorics/
# the site is in japanese so i am unable to completely credit the author
# his name seems to be sinara
module BackTrack
  include Enumerable
  def each
    succeed do |x|
      yield(x)
      return
    end
    traverse do |x|
      prune(x) and next 
      push(x)
      each do |y|; yield(y); end
      pop
    end
  end

  def prune(x); false; end
  def push(x); end
  def pop; end
  def traverse; end
  def succeed;  end
end

class Power
  include BackTrack

  def initialize(m, n = m)
    @stack = []
    @array, @n = (0...m).to_a, n
  end

  def traverse
    @array.each do |x|
      yield x
    end
  end

  def push(x); @stack.push x; end
  def pop; @stack.pop; end
  def succeed; yield @stack if size >= @n; end
  def size; @stack.size; end
end

class Perm < Power
  def prune(x)
    @stack.include? x
  end
end

# I wrote this
class Queen < Perm
  def prune(x)
    super and return true
    @stack.each_with_index do |y, j|
      size+x == j+y or size-x == j-y and return true  #CHECK DIAGONALS BEFORE RETURNING
    end
    false
  end
end
