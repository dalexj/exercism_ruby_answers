class Acronym
  def self.abbreviate(phrase)
    separate_words_from(phrase).map { |word| word[0] }.join.upcase
  end

  def self.separate_words_from(raw_phrase)
    parse(raw_phrase).flat_map { |word| split_compound_word(word) }
  end

  def self.parse(raw_phrase)
    raw_phrase.gsub(/[^a-z]/i, " ").split(" ")
  end

  def self.split_compound_word(word)
    word.scan(/[A-Z]{0,1}[a-z]+|[A-Z]{2,}/)
  end
end
