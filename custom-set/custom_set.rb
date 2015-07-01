class CustomSet
  attr_reader :elements

  def initialize(elements = [])
    @elements = elements.to_a.uniq.sort
  end

  def ==(other)
    elements.sort.uniq == other.elements.sort.uniq
  end

  def to_a
    @elements
  end

  def size
    @elements.size
  end

  def delete(value)
    @elements.reject! { |e| e == value && e.class == value.class }
    self
  end

  def difference(other)
    other.elements.each_with_object(CustomSet.new(@elements)) do |e, set|
      set.delete(e)
    end
  end

  def disjoint?(other)
    (other.elements + @elements).uniq.size == (other.size + size)
  end

  def empty
    @elements = []
    self
  end

  def intersection(other)
    CustomSet.new(intersecting_elements(other))
  end

  def member?(value)
    @elements.any? { |e| e == value && e.class == value.class }
  end

  def put(value)
    @elements << value
    @elements = @elements.uniq.sort
    self
  end

  def subset?(other)
    other.elements.all? { |e| member?(e) }
  end

  def union(other)
    CustomSet.new(@elements + other.elements)
  end

  private

  def intersecting_elements(other)
    @elements.select { |e| other.member?(e) }
  end
end
