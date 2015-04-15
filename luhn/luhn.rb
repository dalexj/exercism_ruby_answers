class Luhn
  attr_reader :addends, :checksum

  def self.create(number)
    check_digit = Luhn.new(number * 10).check_digit
    check_digit.zero? ? (number * 10) : (number * 10) + 10 - check_digit
  end

  def initialize(number)
    @number   = number
    @addends  = calculate_addends
    @checksum = calculate_checksum
  end

  def check_digit
    checksum % 10
  end

  def valid?
    check_digit.zero?
  end

  private

  def calculate_addends
    @number.to_s.reverse.each_char.map.with_index do |digit, index|
      (digit.to_i * (index % 2 + 1)).to_s.each_char.reduce(0) { |sum, digit| sum + digit.to_i }
    end.reverse
  end

  def calculate_checksum
    addends.reduce(:+)
  end
end
