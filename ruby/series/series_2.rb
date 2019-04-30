class Series

  def initialize(series)
    @char_list = series.chars
  end

  def slices(size)
    raise ArgumentError, "slice size > series length" if size > char_list.length

    # cool - feed the group (of "size") into the Enumerable.map
    char_list.each_cons(size).map { |slice| slice.join }
  end

  private

  attr_reader :char_list

end
