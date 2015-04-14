class Element
  include Enumerable
  attr_reader :datum, :next

  def initialize(datum, next_element)
    @datum = datum
    @next = next_element
  end

  def reverse
    reduce(nil) do |last_created_element, element|
      Element.new(element.datum, last_created_element)
    end
  end

  def to_a
    map(&:datum)
  end

  def each
    element = self
    while element
      yield element
      element = element.next
    end
  end

  def self.to_a(element)
    element.to_a
  end

  def self.from_a(array)
    array.reverse_each.reduce(nil) do |previous_element, array_element|
      Element.new(array_element, previous_element)
    end
  end
end
