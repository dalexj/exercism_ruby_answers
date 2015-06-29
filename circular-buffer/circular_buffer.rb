class CircularBuffer
  class BufferFullException < Exception; end
  class BufferEmptyException < Exception; end

  def initialize(max_size)
    @max_size = max_size
    clear
  end

  def read
    raise BufferEmptyException if @buffer.empty?
    @buffer.shift
  end

  def write(value)
    raise BufferFullException if @buffer.size >= @max_size
    write!(value)
  end

  def write!(value)
    @buffer << value if value
    read if @buffer.size > @max_size
  end

  def clear
    @buffer = []
  end
end
