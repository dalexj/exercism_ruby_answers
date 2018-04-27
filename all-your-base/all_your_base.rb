class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base <= 1 || output_base <= 1
    return [] if digits == []

    number = digits.reverse.map.with_index do |digit, index|
      raise ArgumentError if digit >= input_base || digit < 0
      digit * input_base ** index
    end.reduce(0, :+)

    output_digits = []
    loop do
      number, new_digit = number.divmod(output_base)
      output_digits.unshift(new_digit)
      break unless number > 0
    end

    output_digits
  end
end


class BookKeeping
  VERSION = 2
end
