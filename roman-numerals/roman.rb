class Fixnum
  ROMAN_CONVERSION = {
    M:1000, CM:900, D:500, CD:400, C:100, XC:90,
    L:50, XL:40, X:10, IX:9, V:5, IV:4, I:1
  }

  def to_roman
    number = self
    sorted_roman_numerals.reduce("") do |number_in_roman, numeral|
      numeral_amount, number = number.divmod ROMAN_CONVERSION[numeral]
      number_in_roman + numeral.to_s * numeral_amount
    end
  end

  def sorted_roman_numerals
    ROMAN_CONVERSION.keys.sort_by { |numeral| -ROMAN_CONVERSION[numeral] }
  end
end
