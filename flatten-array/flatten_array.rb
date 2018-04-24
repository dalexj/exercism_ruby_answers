class FlattenArray
  VERSION = 1
  def self.flatten(arr)
    return arr if arr.none? { |ele| ele.is_a? Array }
    flatten(arr.reduce([]) { |ary, ele| ary + [*ele] }.reject(&:nil?))
  end
end
