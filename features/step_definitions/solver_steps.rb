#Bundler.require(:test)
require "exhaustive"
require 'ginat'
require 'backtracking'

Given /^I have an exhaustive solver$/ do
  @solver = Exhaustive
end

Given /^I have a Ginat solver$/ do
  @solver = Ginat
end

Given /^I have a BackTracking solver$/ do
  @solver = BackTracking
end

=begin
  @solution is an array.
  For an element, the index represents the row.
  The number represents the column.

  @board is a representation of a game board where
  a queen is a "Q" and an empty space is a period, "."
  Queens and periods are separated by spaces

  Example for N  = 10
  ====== Solution ========
  [0, 2, 5, 7, 9, 4, 8, 1, 3, 6]

  ====== Board ===========
   Q . . . . . . . . .
   . . Q . . . . . . .
   . . . . . Q . . . .
   . . . . . . . Q . .
   . . . . . . . . . Q
   . . . . Q . . . . .
   . . . . . . . . Q .
   . Q . . . . . . . .
   . . . Q . . . . . .
   . . . . . . Q . . .
=end

When /^I solve for N equals (\d+)$/ do |n|
  @N = n.to_i
  @solution = @solver.solve(@N)
  @board = Printer.sprint_board(@solution)
end

Then /^there should be (\d+) queens on the board$/ do |n|
  @solution.size.should eql(n.to_i)
  @board.scan(/./).select{|x| x == 'Q'}.size.should eql(n.to_i)
end

Then /^there should be only 1 Queen per row$/ do 
  @solution.size.should eql(@N)
  @board.lines.select{ |x| x.include? 'Q' }.size.should eql(@N)
end

Then /^there should be only 1 Queen per column$/ do 
  @solution.uniq.size.should eql(@N)
  transposed = @board.lines.map do |n| 
    n.split(' ').select{|x| x == 'Q' || x == '.'}
  end.transpose 
  transposed.select{ |x| x.include? 'Q' }.size.should eql(@N)
end

Then /^there should be only 1 Queen per diagonal$/ do 
  (0...@N).each do |y| 
    @solution.select{ |i| i == y}.size.should eql(1)
  end
  ## not now
end

Then /^I should visually inspect the board$/ do
  if ENV['DEBUG_N_QUEENS']
    puts "====== Solution ========"
    puts @solution.inspect
    puts "====== Board ==========="
    Printer.print_board(@solution) 
  end
end
