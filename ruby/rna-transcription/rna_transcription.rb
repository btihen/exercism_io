class Complement

  COMPLEMENTS = { 'C' => 'G',
                  'G' => 'C',
                  'T' => 'A',
                  'A' => 'U',
                  ''  => '' }

  def self.of_dna letters
    letters.gsub(/[GCTA]/, COMPLEMENTS)
    # letters.gsub(/[GCTA]/, "G" => "C", "C" => "G", "T" => "A", "A" => "U")
    # letters.split('')                  # split string into an array
    #        .map { |l| COMPLEMENTS[l] } # get complement for each array element
    #        .join                       # join back together as a string
  end

end
