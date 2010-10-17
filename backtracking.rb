# from http://blade.nagaokaut.ac.jp/~sinara/ruby/math/combinatorics/
# the site is in japanese so i am unable to completely credit the author
# his name seems to be sinara

require "bt-power.rb"
require "printer.rb"

def solve(n)
  Queen.new(n).each do |x|
    return x
  end
end


if $0 == __FILE__
  n = ARGV[0] ? ARGV[0].to_i : 4
  #print solve(n)
  Printer.print_board(solve(n))
  #print Printer.p_tuple_board(solve(n))
  #Printer.p_file(solve(n))
end