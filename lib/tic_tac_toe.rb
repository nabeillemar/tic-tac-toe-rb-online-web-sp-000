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
