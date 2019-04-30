class Series

  def initialize(series)
    @char_list = series
  end

  def slices(size)
    raise ArgumentError, "slice size > than series length" if size > char_list.length

    max_index = char_list.length - size   # don't iterate beyond full length slices
    (0..max_index).map { |index| char_list.slice(index, size) }
  end

  private

  attr_reader :char_list

end
