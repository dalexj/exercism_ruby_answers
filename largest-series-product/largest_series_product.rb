class Series
  def initialize(sequence)
    @sequence = sequence.chars.map(&:to_i)
  end

  def largest_product(length)
    return 1 if length < 1
    possible_subseries(length).max_by { |subseries| subseries.reduce(1, :*) }.reduce(1, :*)
  end

  private

  def possible_subseries(length)
    raise ArgumentError if length > @sequence.length
    @sequence.each_cons(length)
  end
end
