class Brackets
  VERSION = 1
  BRACKETS = {
    "}" => "{",
    ")" => "(",
    "]" => "[",
  }

  def self.paired?(str)
    chars = str.chars.select { |char| BRACKETS.to_a.flatten.include? char }
    acc = []
    chars.each do |char|
      if BRACKETS[char]
        return false if BRACKETS[char] != acc.pop
      else
        acc << char
      end
    end
    acc == []
  end
end
