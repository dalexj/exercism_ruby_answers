class RunLengthEncoding
  VERSION = 1
  def self.encode(str)
    str.chars.chunk{|a|a}.map do |char, arr|
      arr.length == 1 ? char : "#{arr.length}#{char}"
    end.join
  end

  def self.decode(str)
    str.scan(/\d*\D/).map do |section|
      n = section[0..-2].to_i
      n = 1 if n == 0
      section[-1] * n
    end.join
  end
end
