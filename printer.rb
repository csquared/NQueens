#Chris Continanza
#accessory module from printing a board, a tuple, or writing to the file
#by default, the program will overwrite queens.out
#to change this, at the command line send a second argument of "a"

module Printer
  
  def self.print_board(board)
    n = board.length
    STDOUT.print " "
    (0...n).each {|i| print " " + i.to_s}
    STDOUT.print "\n"
    
    (0...n).each do |i|
      STDOUT.print i
      line =Array.new(n, " .")
      line[board[i]] = " Q"
      STDOUT.print line.to_s + "\n"
    end   
  end

  # has no header row
  def self.sprint_board(board, header = false)
    sink = ""
    n = board.length
    if(header)
      sink << " "
      (0...n).each {|i| sink << " " + i.to_s}
      sink << "\n"
    end
    
    (0...n).each do |i|
      sink << i
      line =Array.new(n, " .")
      line[board[i]] = " Q"
      sink << line.to_s + "\n"
    end   
    sink
  end
  
  def p_tuple_board(board)
    string = ""
    string << "<"
    board.each do |b|
      string << "#{b},"
    end
    string.chop! << ">"
  end
  
  def p_file(board)
    mode = ARGV[1] == "a" ? "a" : "w"
    File.open("queens.out", mode) do |file|
      file << $0
      file << " "
      file << ARGV[0] ? ARGV[0] : 8
      file << "\n"
      file << p_tuple_board(board).to_s + "\n"
    end
  end
end
