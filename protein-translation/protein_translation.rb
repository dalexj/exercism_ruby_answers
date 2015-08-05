
class Translation

  def self.of_codon(codon)
    case codon
    when "AUG"                      then "Methionine"
    when "UUU", "UUC"               then "Phenylalanine"
    when "UUA", "UUG"               then "Leucine"
    when "UCU", "UCC", "UCA", "UCG" then "Serine"
    when "UAU", "UAC"               then "Tyrosine"
    when "UGU", "UGC"               then "Cystine"
    when "UGG"                      then "Tryptophan"
    when "UAA", "UAG", "UGA"        then "STOP"
    else raise InvalidCodonError
    end
  end

  def self.of_rna(rna)
    (0..2).each_with_object([]) do |n, translation|
      translation << of_codon(rna[n * 3, 3])
      return translation[0..-2] if translation.last == "STOP"
    end
  end
end
class InvalidCodonError < Exception
end
