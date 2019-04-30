class Pangram

  def self.pangram? sentence
    string   = sentence.to_s
    ('a'..'z').all? { |letter| string.downcase.include?(letter) }

    # return false if string.eql? ""
    #
    # # make a hash of all letters with their count
    # tracker = Hash[ ('a'..'z').collect { |letter| [letter, 0] } ]
    #
    # # downcase string into an array of characters & filter out non letters
    # letters = string.downcase.scan /[a-z]/
    #
    # # loop through each letter and add one to the tracker for each letter
    # letters.each { |l| tracker[l] += 1 }
    #
    # # are all letters non-zero in the hash
    # tracker.none? { |letter,count| count == 0 }
  end

end
