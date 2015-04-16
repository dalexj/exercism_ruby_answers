class Cipher
  attr_reader :key

  def initialize(key = nil)
    @key = key || generate_random_key
    validate_key_is_lowercase_letters
  end

  def encode(plaintext)
  end

  def decode(ciphertext)
  end

  def rotate_amounts
    key.chars.map { |char| char.ord - 97 }
  end

  # private

  def rotate_char(char, rotate_amount)
    (((char.ord + rotate_amount - 97) % 26) + 97).chr
  end

  def generate_random_key
    100.times.map { random_lowercase_letter }.join
  end

  def random_lowercase_letter
    ("a".."z").to_a.sample
  end

  def validate_key_is_lowercase_letters
    raise ArgumentError unless @key =~ /\A[a-z]+\z/
  end
end

Cipher.new.rotate_amounts
