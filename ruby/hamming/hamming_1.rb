class Hamming

  def self.compute(dna_1, dna_2)
    raise ArgumentError unless dna_1.length == dna_2.length
    return 0                if dna_1.eql? dna_2

    strands_1 = dna_1.chars
    strands_2 = dna_2.chars

    # compare dna strands by position & count strands that DO NOT Match
    strands_1.each.with_index.count do |strand, idx|
      not (strand.eql? strands_2[idx])
    end
  end

end
