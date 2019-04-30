class Anagram

  def initialize word
    @master_word  = word.downcase
    @master_count = count_letters
  end

  def match *candidates
    candidates.flatten
              .select { |test_word| test_word  if is_anagram? test_word }
  end

  private

  attr_reader :master_word, :master_count

  def count_letters string = master_word
    string.downcase.chars
          .each_with_object(Hash.new(0)) { |char,counts| counts[char] += 1 }
  end

  def is_anagram? test_word
    return false if master_word.eql? test_word.downcase 

    test_count = count_letters test_word
    master_count == test_count
  end

end
