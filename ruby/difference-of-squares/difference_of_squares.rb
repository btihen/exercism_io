class Squares

  attr_reader :square_of_sum, :sum_of_squares, :difference

  def initialize integer_limit
    range           = (1..integer_limit)
    @square_of_sum  = range.sum**2
    @sum_of_squares = range.sum { |i| i**2 }
    @difference     = square_of_sum  - sum_of_squares
  end

end
