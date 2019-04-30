class Acronym

  def self.abbreviate string
    string.scan(/\w+/)         # split words into array (separated by " " or punctuation)
          .map { |w| w[0, 1] } # get the first letter of each word
          .join.upcase         # join cap letters into a string & upcase
    string.scan(/(\w+)/)                # ["Ruby", "on", "Rails"]
    string.scan(/(\w+)/){ |w| w[0, 1] } # "Ruby on Rails"
    string.scan(/\w+/)         # split words into array (separated by " " or punctuation)
          .map { |w| w.first } # get the first letter of each word
          .join.upcase         # join cap letters into a string & upcase

  end

end
