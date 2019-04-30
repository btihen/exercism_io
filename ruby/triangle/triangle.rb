class Triangle

  def initialize triangle_sides
    @triangle_sides = triangle_sides
    @max_side       = triangle_sides.max
    @semiperimeter  = triangle_sides.sum / 2.0
  end

  def equilateral?
    valid_triangle? && equal_sides_count == 3
  end

  def isosceles?     # equilaterals are also isosceles
    valid_triangle? && equal_sides_count >= 2
  end

  def scalene?
    valid_triangle? && equal_sides_count == 1
  end

  private

  attr_reader :triangle_sides, :max_side, :semiperimeter

  def valid_triangle?
    max_side < semiperimeter   # triangle must pass inequality test
  end

  def equal_sides_count
    triangle_sides.count { |s| s == max_side }
  end

end
