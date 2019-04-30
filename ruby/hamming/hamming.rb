require 'pry'

class Hamming

  def self.compute(dna_1, dna_2)
    raise ArgumentError unless dna_1.length == dna_2.length
    return 0                if dna_1.eql? dna_2

    strands_1 = dna_1.chars
    strands_2 = dna_2.chars


    strands_1.zip(strands_2)                                 # paired the dna strands by position
             .count { |strand1,strand2| strand1 != strand2 } # count the non-equal positions
  end

end
