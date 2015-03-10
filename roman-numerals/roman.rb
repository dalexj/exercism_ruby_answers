# class Fixnum
#   def to_roman
#     number = self
#     roman_values = {M:1000, CM:900, D:500, CD:400, C:100, XC:90, L:50, XL:40, X:10, IX:9, V:5, IV:4, I:1}
#
#     roman_values.keys.reduce("") do |numerals, key|
#       numeral_amount, number = number.divmod roman_values[key]
#       numerals + key.to_s * numeral_amount
#     end
#   end
# end
require 'roman-numerals'
class Fixnum
  def to_roman
    RomanNumerals.to_roman(self)
  end
end
