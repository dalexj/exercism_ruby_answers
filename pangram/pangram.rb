class Pangram
  VERSION = 1
  ALL_LETTERS = ("a".."z").to_a
  def self.is_pangram?(str)
    str.downcase.gsub(/[^a-z]/, "").chars.uniq.sort == ALL_LETTERS
  end
end
