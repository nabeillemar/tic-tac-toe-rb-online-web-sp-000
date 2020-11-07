def display_board(board)
  puts " # | # | # "
  puts "-----------"
  puts " # | # | # "
  puts "-----------"
  puts " # | # | # "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def player_move(board, index, marker)
 board[index] = marker
end

def position_taken? (board, index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if !position_taken?(board, index) && (index).between?(0,8)
    return true
  else 
    return false
  end
end
