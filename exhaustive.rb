# from http://blade.nagaokaut.ac.jp/~sinara/ruby/math/combinatorics/
# the site is in japanese so i am unable to completely credit the author
# his name seems to be sinara

#require "combinatorial.rb"
require "printer.rb"

module Exhaustive
  def self.queen_check(a)
    a.each_with_index do |x, i|
      a[0, i].each_with_index do |y, j|
        return false if x + i == y + j or x - i == y - j  #returns false for diagonals
      end
    end
    true
  end

  def self.solve(n)
    #Combinatorial.perm(n) do |x|  #passes an array of each permutation to the code block
    (0...n).to_a.permutation do |x|
      return x if self.queen_check(x)  #returns the valid solution according to queen_check(x)
    end 
  end
end

if $0 == __FILE__
  n = ARGV[0] ? ARGV[0].to_i : 4
  #print solve(n)
  Printer.print_board(Exhaustive.solve(n))
   #print Printer.p_tuple_board(solve(n))
  #Printer.p_file(solve(n))
end
