class PigLatin
  def self.translate(words)
    words.split(" ").map { |word| word_translate(word) }.join(" ")
  end

  def self.word_translate(word)
    move_first_sound_to_end(word) + "ay"
  end

  def self.move_first_sound_to_end(word)
    if starts_with_vowel?(word) || starts_with_edge_case?(word)
      word
    else
      sound_length = length_of_starting_consonants(word)
      word[sound_length..-1] + word[0, sound_length]
    end
  end

  def self.starts_with_vowel?(word)
    word =~ /\A[aeiou]/i || word =~ /\Ay[^aeiou]/i
  end

  def self.starts_with_edge_case?(word)
    %w[xr].any? { |edge_case| word.start_with?(edge_case) }
  end

  def self.length_of_starting_consonants(word)
    special_case = %w[thr ch sch th qu thr squ].find { |sound| word.start_with?(sound) }
    special_case ? special_case.length : 1
  end
end
