class Phrase

  def initialize sentence
    @words = sentence.downcase
                     .gsub(" '", ' ').gsub("' ", " ")
                     .gsub(/[^'0-9a-z]/i, ' ').split
  end

  def word_count
    words.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
  end

  private

  attr_reader :words

end
