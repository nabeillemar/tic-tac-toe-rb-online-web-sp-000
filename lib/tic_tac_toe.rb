













def turn_count(board)
  counter = 0 
  board.each do |token|
  if token == "X" || token == "O"
    counter += 1 
    end 
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0 
  return "X"
else 
  return "O"
  end
end 
  

WIN_COMBINATIONS = [
  [0,1,2], #Top Row
  [3,4,5], # Middle Row 
  [6,7,8], # bottom Row
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  ]
  
  def won?(board)
   WIN_COMBINATIONS.find do |match_array|
   if position_taken?(board, match_array[0]) && board[match_array[0]] == board[match_array[1]] && board[match_array[1]] == board[match_array[2]]
     return match_array
   end
 end
end

def full?(board)
  board.all? do |box|
    box == "X" || box == "O"
  end 
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) 
end

def winner(board)
 if won?(board) 
   first_index = won?(board)[0] 
  return board[first_index]
end
end
