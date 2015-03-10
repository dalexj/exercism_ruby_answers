class Hamming
  def self.compute(a, b)
    a.chars[0,b.length].zip(b.chars).count{|c|c.reduce(&:!=)}
  end
end
