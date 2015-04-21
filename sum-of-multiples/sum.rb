class SumOfMultiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(number)
    new(3, 5).to(number)
  end

  def to(end_number)
    (min_multiple...end_number).reduce(0) do |sum, number|
      is_multiple?(number) ? sum + number : sum
    end
  end

  private

  def is_multiple?(number)
    @multiples.any? { |multiple| number % multiple == 0 }
  end

  def min_multiple
    @multiples.min
  end
end
