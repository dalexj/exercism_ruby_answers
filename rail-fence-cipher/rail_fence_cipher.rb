class RailFenceCipher
  VERSION = 1

  def self.encode(str, number_of_rails)
    encode_onto_rails(str.chars, number_of_rails).join
  end

  def self.decode(str, number_of_rails)
    encode_onto_rails(0...str.length, number_of_rails)
      .flatten.compact.zip(str.chars)
      .sort_by { |placement, char| placement }
      .map { |placement, char| char }.join
  end

  def self.encode_onto_rails(arr, number_of_rails)
    arr.each_with_index.each_with_object(Array.new(number_of_rails) { [] }) do |(char, index), rails|
      rails[get_rail_num(number_of_rails, index)][index] = char
    end
  end

  def self.get_rail_num(num_rails, index)
    n = num_rails - 1
    return 0 if index == 0 || n == 0
    index = index % (n * 2)
    index > n ? (n * 2) - index : index
  end
end
