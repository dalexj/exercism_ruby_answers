class Element
  attr_reader :datum, :next
  attr_accessor :prev

  def initialize(datum, next_element)
    @datum = datum
    @next = next_element
    @next.prev = self if @next
  end

  def reverse
    new_head = Element.new(get_last_element.datum)
    current_element = get_last_element.prev
    while current_element
      
      current_element = current_element.prev
    end
  end

  def get_last_element
    last_element ||= self
    while last_element.next
      last_element = last_element.next
    end
    last_element
  end

  def self.to_a(element)
    accumulator = []
    until element.nil?
      accumulator << element.datum
      element = element.next
    end
    accumulator
  end
end
