require 'pry'

class Nucleotide

  def self.from_dna dna
    @dna_strands = dna.scan(/\w/)
    raise ArgumentError unless @dna_strands.all? {|strand| %w[A T C G].include? strand }

    self
  end

  def self.histogram
    strand_counts = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
    return strand_counts if @dna_strands.empty?

    @dna_strands.each { |strand| strand_counts[strand] += 1 }
    strand_counts
  end

  def self.count find_strand
    @dna_strands.select
                .with_index { |strand, idx| strand if strand.eql? find_strand }
                .count
  end

end
