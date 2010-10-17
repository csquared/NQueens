# from http://blade.nagaokaut.ac.jp/~sinara/ruby/math/combinatorics/
# the site is in japanese so i am unable to completely credit the author
# his name seems to be sinara

module Combinatorial
  def power(n, m = n)
    if m == 0
      yield([])
    else
      power(n, m - 1) do |x|
        (0...n).each do |i|
          yield([i] + x)
        end
      end
    end
  end

  def perm(n, m = n)
    if m == 0
      #puts "BASE CASE"
      yield([])
    else
     # puts "#{n} choose #{m}"
      perm(n - 1, m - 1) do |x|  #recursive call
       # puts "RECURSIVE RETURNS x: #{x}"
        (0...n).each do |i|
          #puts "n: #{n}, i: #{i}"
          yield([i] + x.collect{|j| j < i ? j : j + 1})  #passes array[i] with to code block
        end
      end
    end
  end

  def comb(n, m = n)
    if m == 0
      yield([])
    else
      comb(n, m - 1) do |x|
        (((x[0] || -1) + 1)...n).each do |i|
          yield([i] + x)
        end
      end
    end
  end
  
  def rep_comb(n, m)
     if m == 0
       yield([])
     else
       rep_comb(n, m - 1) do |x|
         ((x.empty? ? 0 : x.last)...n).each do |i|
          yield(x+[i])
         end
       end
     end
  end

  module_function :power, :perm, :comb, :rep_comb
end
