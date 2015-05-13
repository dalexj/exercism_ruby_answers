class Deque
  def push(data)
    element = Element.new(data)
    element.prev = @tail
    @tail.next = element if @tail
    @tail = element
    @head ||= @tail
  end

  def pop
    return if @tail.nil?
    data = @tail.data
    @tail = @tail.prev
    @head = nil if @tail.nil?
    data
  end

  def shift
    return if @head.nil?
    data = @head.data
    @head = @head.next
    @tail = nil if @head.nil?
    data
  end

  def unshift(data)
    element = Element.new(data)
    element.next = @head
    @head.prev = element if @head
    @head = element
    @tail ||= @head
  end
end

class Element
  attr_reader :data
  attr_accessor :next, :prev
  def initialize(data)
    @data = data
  end
end
