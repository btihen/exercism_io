require 'pry'

class Triplet

  attr_reader :sides, :a, :b, :c

  def initialize(*sides)
    @sides = *sides.sort  # ensures a < b < c
    @a = sides[0]
    @b = sides[1]
    @c = sides[2]

    return ArgumentError unless valid?
  end

  def sum
    # a + b + c
    @sides.sum
  end

  def product
    # a * b * c
    @sides.reduce(:*)
  end

  def pythagorean?
    (a**2 + b**2) == c**2    # since its a valid triangle is it pythagorean?
  end

  # to minimize calculations used the modified Euliers formula
  # https://en.wikipedia.org/wiki/Formulas_for_generating_Pythagorean_triples
  # https://en.wikipedia.org/wiki/Pythagorean_triple
  # The following will generate all Pythagorean triples uniquely:
  # a=k(m^2-n^2), b=k(2mn), c=k(m^2+n^2)
  # where m, n, and k are positive integers with m > n,
  # and with m and n coprime and not both odd (I ignored not both odd & tested)
  def self.where(min_factor: 1, max_factor:, sum: nil)
    factors = (min_factor..max_factor)
    sum     = sum
    triplets = []
    max_m = max_factor/2                # using max/2 instead of sqrt(max)-1 - close enough
    max_n = max_m - 1                   # n must be less than m
    (1..max_n).each do |n|
      (n+1..max_m).each do |m|
        (1..max_factor).each do |k|     # max value is unimportant we stop scaling when beyond target sum
          triangle = generate_triplet(k, m, n)
          triplets << triangle         if match_criteria?(factors, sum, triangle)
          break                        if sum && (triangle.sum > sum)
        end
      end
    end
    triplets.uniq { |t| [t.a, t.b].sort } # sort unique removes mirrored triangles (where a & b are swapped)
  end

  def self.generate_triplet(k, m, n)
    a = k * (m**2 - n**2)
    b = k * (2*m*n)
    c = k * (m**2 + n**2)
    Triplet.new(a, b, c)
  end

  def self.match_criteria?(factors, sum, triangle)
    return false   unless factors.include?( triangle.a ) && factors.include?( triangle.b ) && factors.include?( triangle.c )
    return true        if sum.nil?
    return true        if sum && (triangle.sum == sum)
    false
  end

  private
  def valid?
    return false unless sides.length == 3        # 3 sides given?
    return false unless sides.all? { |s| s > 0 } # all sides greater than 0?
    return false unless (a < b) && (b < c)       # is a smaller than b smaller than c?
  end

end
