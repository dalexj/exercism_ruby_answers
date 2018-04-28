class Isogram
  def self.isogram?(str)
    str = str.gsub(/[^A-Z]/i, "").downcase
    str.chars.count == str.chars.uniq.count
  end
end

class BookKeeping
  VERSION = 4
end
