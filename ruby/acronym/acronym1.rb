class Acronym

  def self.abbreviate words
    words.split(/[ -]/)
         .map { |w| w[0, 1].upcase unless w.eql? ' ' }
         .join
  end

end
