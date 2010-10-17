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
