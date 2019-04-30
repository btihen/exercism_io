class CollatzConjecture

  def self.steps number
    raise ArgumentError        unless number > 0 && number.is_a?(Integer)

    count_steps = 0
    until number == 1 do
      number = (number % 2).zero? ? (number / 2) : (3 * number + 1)
      count_steps += 1
    end
    count_steps
  end

end
