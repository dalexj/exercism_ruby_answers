class Deque
  def push(data)
    @tail = Element.new(data, prev: @tail)
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
    @head = Element.new(data, next: @head)
    @tail ||= @head
  end
end

class Element
  attr_reader :data
  attr_accessor :next, :prev
  def initialize(data, connections = {})
    @data = data
    make_connections(connections)
  end

  def make_connections(connections)
    @next = connections[:next]
    @prev = connections[:prev]
    @next.prev = self if @next
    @prev.next = self if @prev
  end
end
