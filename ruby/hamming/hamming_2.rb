class Hamming

  def self.compute(dna_1, dna_2)
    raise ArgumentError unless dna_1.length == dna_2.length
    return 0                if dna_1.eql? dna_2

    strands_1 = dna_1.chars
    strands_2 = dna_2.chars

    strands_1.zip(strands_2)        # make an array of paired strands from the two dna_strands
             .count do |compare|    # count paired strands that are not the same
               not (compare[0].eql? compare[1])
             end
  end

end
