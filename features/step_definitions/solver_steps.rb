require "exhaustive.rb"
require 'ginat.rb'

Given /^I have an exhaustive solver$/ do
  @solver = Exhaustive
end

Given /^I have a Ginat solver$/ do
  @solver = Ginat
end

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
  (0...@N).each{ |y| @solution.should include(y) }
  ## not now
end

Then /^I should visually inspect the board$/ do
  puts "====== Solution ========"
  puts @solution.inspect
  puts "====== Board ==========="
  Printer.print_board(@solution) 
end
