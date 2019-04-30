class Acronym

  def self.abbreviate string
    string.scan(/\w+/)         # split ~words into an array
          .map { |w| w[0, 1] } # get the first letter of each word
          .join.upcase         # join array into string & use caps
  end

end
