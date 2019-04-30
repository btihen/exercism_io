class Array

  def accumulate &block
    new_array = []
    each do |value|
      new_array << block.call(value)
    end
    new_array
  end

end
