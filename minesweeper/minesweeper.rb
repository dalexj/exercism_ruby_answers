class Board

  ACCEPTED_CHARS = [" ", "+", "-", "*", "|"]
  BORDER_REGEX = /\A\+-*\+\z/

  def self.transform(input)
    raise ValueError unless all_chars_acceptable?(input)
    raise ValueError unless correct_border?(input)
    raise ValueError unless all_rows_same_length?(input)
    input.map.with_index do |row, row_index|
      row.gsub(/./).with_index do |spot, char_index|
        mines = count_mines_around(input, row_index, char_index)
        mines.class != String && mines.zero? ? " " : mines.to_s
      end
    end
  end

  def self.count_mines_around(board, row, col)
    return board[row][col] unless board[row][col] == " "
    (row - 1..row + 1).reduce(0) do |total, r|
      total + (col - 1..col + 1).count { |c| board[r][c] == "*" }
    end
  end

  def self.all_chars_acceptable?(board)
    board.all? do |row|
      row.chars.all? { |char| ACCEPTED_CHARS.include? char }
    end
  end

  def self.correct_border?(board)
    board.first =~ BORDER_REGEX && board.last =~ BORDER_REGEX &&
    board[1..-2].all? { |row| row =~ /|[ 1-9*]|/ }
  end

  def self.all_rows_same_length?(board)
    board.map(&:length).uniq.size == 1
  end
end

class ValueError < Exception
end
