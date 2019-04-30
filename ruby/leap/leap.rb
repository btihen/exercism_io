class Year

  def self.leap? year
    return true  if year_divisible_by_4_not_divisible_by_100? year
    return false if year_divisible_by_100_not_divisible_by_400? year
    return true  if year_divisible_by_400_leap_year? year
    return true  if  (year % 4) == 4

    false
  end

  private

  def self.year_divisible_by_4_not_divisible_by_100? year
    (year % 4 == 0)   && !(year % 100 == 0)
  end

  def self.year_divisible_by_100_not_divisible_by_400? year
    (year % 100 == 0) && !(year % 400 == 0)
  end

  def self.year_divisible_by_400_leap_year? year
    (year % 400 == 0)
  end

end
