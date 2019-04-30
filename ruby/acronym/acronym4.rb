class Acronym

  def self.abbreviate string
    string.scan(/\b[a-zA-Z]/)  # array of first letters of words - matches word boundaries followed by a letter([a-zA-Z])
          .join.upcase         # join array into string & use caps
  end

end
