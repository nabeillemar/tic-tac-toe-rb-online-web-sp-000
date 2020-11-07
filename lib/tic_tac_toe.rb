
# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
  counter = 0
  until counter == 9 
  turn(board)
  counter += 1 
end
end


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
