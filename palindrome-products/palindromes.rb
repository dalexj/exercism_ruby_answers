class Palindromes
  attr_reader :largest, :smallest
  def initialize(max_factor: , min_factor: 1)
    @max_factor, @min_factor = max_factor, min_factor
  end

  def generate
    @largest  = LargePalindrome.new @max_factor, @min_factor
    @smallest = SmallPalindrome.new @max_factor, @min_factor
  end

  def self.palindrome?(num)
    num.to_s == num.to_s.reverse
  end
end

class BasePalindrome
  def initialize(max_factor, min_factor)
    @max_factor, @min_factor = max_factor, min_factor
  end

  def values
    all_combinations_of_two_factors.map{|num1,num2| num1*num2}.select do |num|
      Palindromes.palindrome? num
    end
  end

  def factors
    (@min_factor..@max_factor).map do |number|
      [number, value / number] if (value % number).zero? && value / number < @max_factor
    end.compact.map(&:sort).uniq
  end

  def all_combinations_of_two_factors
    @combinations ||= (@min_factor..@max_factor).to_a.repeated_permutation(2).to_a
  end
end

class LargePalindrome < BasePalindrome
  def value
    @value ||= values.max
  end
end

class SmallPalindrome < BasePalindrome
  def value
    @value ||= values.min
  end
end
