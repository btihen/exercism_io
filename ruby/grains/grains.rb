class Grains

  FIRST  = 1  # first square quantity
  FACTOR = 2  # doubles for each square

  def self.square square
    raise ArgumentError, "square must be between 1 and 64" unless (1..64).cover?(square)

    FACTOR ** (square - 1)
  end

  def self.total square = 64
    raise ArgumentError, "square must be between 1 and 64" unless self.valid? square

    (FACTOR ** square) - 1
  end

  private
  attr_reader :square

  def self.valid? square
    square >= 1 && square <= 64
  end

end
