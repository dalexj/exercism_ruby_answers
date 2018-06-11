class IsbnVerifier
  def self.valid?(isbn_number)
    isbn_number = isbn_number.gsub("-", "")
    return false unless valid_format?(isbn_number)

    total = isbn_number.chars.map.with_index do |digit, index|
      (digit == "X" ? 10 : digit.to_i) * (10 - index)
    end.reduce(:+)

    total % 11 == 0
  end

  def self.valid_format?(isbn_number)
    [
      isbn_number.length == 10,
      isbn_number[0..8] =~ /\A[0-9]+\z/,
      isbn_number[-1] =~ /[0-9X]/,
    ].all?
  end
end


class BookKeeping
  VERSION = 1
end
