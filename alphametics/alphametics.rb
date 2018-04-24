module BookKeeping
  VERSION = 1
end

class Alphametics
  def solve(str)
    setup(str)
    format_answer possibilities.find { |poss| answer?(poss) }
  end

  private

  def setup(str)
    split = str.split(" ")

    @str1     = split[0].chars
    @operator = split[1]
    @str2     = split[2].chars
    @result   = split[-1].chars
    @should_square = split[3] == "^"

    @chars = (@str1 + @str2 + @result).uniq
    @nonzero_chars = [@str1, @str2, @result].map(&:first).uniq
  end

  def possibilities
    (0..9).to_a.permutation(@chars.length)
  end

  def answer?(possibility)
    return false if @nonzero_chars.any?{ |chr| possibility[@chars.index(chr)] == 0 }
    answer = replace_str(@str1, possibility).send(@operator, square_if_should(replace_str(@str2, possibility)))
    answer == replace_str(@result, possibility)
  end

  def replace_str(str, possibility)
    str.map { |chr| possibility[@chars.index(chr)] }.map(&:to_s).join.to_i
  end

  def format_answer(answer)
    @chars.zip(answer).to_h if answer
  end

  def square_if_should(num)
    @should_square ? num * num : num
  end
end
