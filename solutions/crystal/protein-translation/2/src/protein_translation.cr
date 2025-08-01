module ProteinTranslation
  # AUG	Methionine
#UUU, UUC	Phenylalanine
#UUA, UUG	Leucine
#UCU, UCC, UCA, UCG	Serine
#UAU, UAC	Tyrosine
#UGU, UGC	Cysteine
#UGG	Tryptophan
#UAA, UAG, UGA	STOP

  def self.protein(codon : String) : String
    case codon
    when "AUG"
      "Methionine"
    when "UUU", "UUC"
      "Phenylalanine"
    when "UUA", "UUG"
      "Leucine"
    when "UCU", "UCC", "UCA", "UCG"
      "Serine"
    when "UAU", "UAC"
      "Tyrosine"
    when "UGU", "UGC"
      "Cysteine"
    when "UGG"
      "Tryptophan"
    when "UAA", "UAG", "UGA"
      "STOP"
    else
      raise ArgumentError.new("Unknown Codon")
    end
  end

  def self.proteins(strand : String) : Array(String)
    (
        strand.each_char.each_slice(3).map do |slice|
          self.protein(slice.join)
        end.take_while do |protein|
          protein != "STOP"
        end
    ).to_a
  end
end
