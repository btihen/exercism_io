class PhoneNumber

  def self.clean human_phone_num
    clean_number = human_phone_num.scan(/\d/).join    # grab only numbers and join into a string
                                  .gsub(/^[0|1]/,'')  # remove leading pre-dial numbers (0 or 1 at start)

    # experimenting with alternative validations
    # return nil          if %w[0 1].include?(clean_number[0]) # number is invalid if the area code starts with 0 or 1
    # return nil          if ('0'..'1').cover?(clean_number[3]) # number is invalid if the exchange code starts with 0 or 1
    # return clean_number if clean_number.length == 10  # number is valid if 10 characters long

    return nil          if clean_number[0] =~ /[0|1]/ # number is invalid if the area code starts with 0 or 1
    return nil          if clean_number[3] =~ /[0|1]/ # number is invalid if the exchange code starts with 0 or 1
    return nil      unless clean_number.length == 10

    clean_number
  end

end
