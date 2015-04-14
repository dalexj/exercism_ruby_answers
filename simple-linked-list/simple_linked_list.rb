class Element
  attr_reader :datum, :next

  def initialize(datum, next_element)
    @datum = datum
    @next = next_element
  end

  def reverse
    current_element = self
    last_created_element = nil
    while current_element
      last_created_element = Element.new(current_element.datum, last_created_element)
      current_element = current_element.next
    end
    last_created_element
  end

  def to_a
    accumulator = []
    element = self
    while element
      accumulator << element.datum
      element = element.next
    end
    accumulator
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
