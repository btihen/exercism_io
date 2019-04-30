class Hamming

  def self.compute(dna_1, dna_2)
    raise ArgumentError unless dna_1.length == dna_2.length
    return 0                if dna_1.eql? dna_2

    strands_1 = dna_1.scan(/\w/)
    strands_2 = dna_2.scan(/\w/)

    strands_1.reject.with_index do |strand, idx|
      strand if strand.eql? strands_2[idx]
    end.count
  end

end
