class RotationalCipher

  LOWERCASE_LETTERS = ("a".."z").to_a
  UPPERCASE_LETTERS = ("A".."Z").to_a

  def self.rotate(input, key)
    input.chars.map do |char|
      lowercase_letter_index = LOWERCASE_LETTERS.index(char)
      uppercase_letter_index = UPPERCASE_LETTERS.index(char)
      if lowercase_letter_index
        LOWERCASE_LETTERS[(lowercase_letter_index + key) % 26]
      elsif uppercase_letter_index
        UPPERCASE_LETTERS[(uppercase_letter_index + key) % 26]
      else
        char
      end
    end.join
  end
end


class BookKeeping
  VERSION = 1
end
