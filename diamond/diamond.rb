class Diamond
  def self.make_diamond(highest_letter)
    letters = ("A"..highest_letter).to_a
    diamond = letters.each_with_index.map do |letter, index|
      outer_spaces = " " * (letters.length - 1 - index)
      if index == 0
        "#{outer_spaces}#{letter}#{outer_spaces}\n"
      else
        inner_spaces = " " * ((index - 1) * 2 + 1)
        "#{outer_spaces}#{letter}#{inner_spaces}#{letter}#{outer_spaces}\n"
      end
    end

    diamond.concat(diamond[0..-2].reverse).join
  end
end


class Bookkeeping
  VERSION = 1
end
