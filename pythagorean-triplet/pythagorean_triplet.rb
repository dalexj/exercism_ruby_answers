class Triplet

  def self.where(max_factor:, min_factor: 1, sum: nil)
  end

  def initialize(*sides)
    @sides = sides
  end

  def sum
    @sides.reduce(0, :+)
  end

  def product
    @sides.reduce(1, :*)
  end

  def pythagorean?
    @sides.any? { |side| side**2 == add_other_two_sides(side) }
  end

  private

  def add_other_two_sides(long_side)
    (@sides - [long_side]).map { |side| side**2 }.reduce(0, :+)
  end
end
