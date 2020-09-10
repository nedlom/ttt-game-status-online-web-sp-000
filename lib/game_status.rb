# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
=begin
def won?(board)
  WIN_COMBINATIONS.each do |win|
    x = board[win[0]]
    y = board[win[1]]
    z = board[win[2]]
    
    if x == 'X' && y == 'X' && z == 'X'
      return win
    end
    
    if x == 'O' && y == 'O' && z == 'O'
      return win
    end
  end
  false
end
=end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all?{|index| position_taken?(board, index) && board[index] == "X"}
      return combo
    end
    if combo.all?{|index| position_taken?(board, index) && board[index] == "O"}
      return combo
    end
  end
  false
end

def full?(board)
  #!board.any?{|position| position == " "}
  board.all?{|index| index == "X" || index == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

