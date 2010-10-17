require "printer"

def nQueensGinat
  def solve(n)
    order = (n-4).modulo(6)
    
    case order
      when 1,3
        simple_case(n)
      when 0,2
        board = simple_case(n+1)[1..n]
        board.each_with_index do |x, y|
          board[y] = x-1
        end
      when 4
        board = simple_case(n-1) << n-1
        swap_columns(board, n) 
      when 5
        board = simple_case(n-2) << n-2
        board = swap_columns(board, n-1)
        board.each_with_index do |x, y|
          board[y] = x+1
        end
        [0] + board
      else
        print "Problems"
    end
  end
    
  def simple_case(n)
    board = Array.new(n)
    (0...n).each do |i| 
      board[i] = (2*i).modulo(n) 
    end
    board
  end
  
  def swap_columns(board, n)
    offset = 2 + (n-8)/2
    
    temp = board[0]
    board[0] = board[offset]
    board[offset] = temp
    
    temp = board[n-1]
    board[n-1] = board[n-1-offset]
    board[n-1-offset] = temp
    board
  end

end

if $0 == __FILE__
  n = ARGV[0] ? ARGV[0].to_i : 8
  #print solve(n)
  Printer.print_board(nQueensGinat.solve(n))
  #print Printer.p_tuple_board(nQueensGinat.solve(n))
  #Printer.p_file(nQueensGinat.solve(n))
end