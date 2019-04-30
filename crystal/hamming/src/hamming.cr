# Please implement your solution to hamming in this file
class Hamming
  # include Enumerable(Int32)

  def self.compute(str_1, str_2)
    locations = Array(Int32).new
    str_1.to_enum.with_index(1).map{ locations << i unless str_1[index].eql?(str_2[index]) }.size
    #   .each_with_index { |char, i| locations << i unless str_1[i].eql?(str_2[i]) }
    # locations.size
    # str_1.map_with_index { |char, i| str_1[i].eql?(str_2[i]) }.size
  end

end
