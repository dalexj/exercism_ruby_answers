class BinarySearch
  attr_reader :list

  def initialize(list)
    raise ArgumentError if list != list.sort
    @list = list
  end

  def middle
    @list.length / 2
  end

  def search_for(value)
    raise RuntimeError if list.length == 0
    if list[middle] == value
      middle
    elsif list[middle] > value
      BinarySearch.new(list[0...middle]).search_for(value)
    else
      middle + 1 + BinarySearch.new(list[middle + 1..-1]).search_for(value)
    end
  end
end
