class Series
  attr_reader :numbers
  def initialize(numbers)
    @numbers = numbers
  end

  def slices(slices)
    raise ArgumentError if numbers.length < slices
    (slices..@numbers.length).collect do |number|
      @numbers[number - slices..number - 1].chars.collect { |char| char.to_i }
    end
  end
end
