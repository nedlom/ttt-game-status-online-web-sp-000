board = ["O", "O", " ", "X", "X", "X", " ", " ", " "]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all?{|index| position_taken?(board, index) && board[index] == "X"}
      return combo
    elsif combo.all?{|index| position_taken?(board, index) && board[index] == "O"}
      return combo
    else
      return false
    end
  end
end

puts won?(board)