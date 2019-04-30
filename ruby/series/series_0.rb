class Series

  def initialize(series)
    @char_list = series.chars
  end

  def slices(size)
    raise ArgumentError, "slice size > than series length" if size > char_list.length

    char_list.map                                     # make an array
             .with_index{ |_,i| get_slice(i, size) }  # incrementally get slices from original array
             .compact                                 # remove nils
  end

  private

  attr_reader :char_list

  def get_slice(index, size)
    clump = char_list.slice(index, size).join  # create a sting after getting the slice
    return clump unless clump.length < size    # only return useful data if of the correct length
  end

end
