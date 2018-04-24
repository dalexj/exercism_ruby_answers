class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number <= 0
    factors = (1..number/2).select { |n| (number % n).zero? }
    {
       1 => "abundant",
       0 => "perfect",
      -1 => "deficient",
    }[factors.reduce(0, :+) <=> number]
  end
end

class BookKeeping
  VERSION = 1
end
