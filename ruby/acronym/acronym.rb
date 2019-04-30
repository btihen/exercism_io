class Acronym

  FIRST_LETTER_REGEX  = { en: /\b[a-zA-Z]/,
                          de: /\b[äöüßa-zÄÖÜA-Z]/,
                          it: /\b[áéíóúa-zÁÉÍÓÚA-Z]/,
                        }
  def self.abbreviate multiple_words, lang = :en
    acronym = multiple_words.scan(FIRST_LETTER_REGEX[lang]).join.upcase
    raise ArgumentError, "An acronym requires multiple words" unless acronym.length > 1

    acronym
  end

end
