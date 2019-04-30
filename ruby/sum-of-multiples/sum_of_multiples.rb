class SumOfMultiples

  def initialize *base_numbers
    @base_numbers = base_numbers
  end

  def to max
    return 0 if base_numbers.max == 0

    base_numbers.map do |base|
      (1..get_range(base, max)).map { |mult| base * mult }
    end.flatten.uniq.sum
  end

  private

  attr_reader :base_numbers

  def get_range base, max
    range_max  = max / base
    return range_max -= 1  if base * range_max == max

    range_max
  end

end
