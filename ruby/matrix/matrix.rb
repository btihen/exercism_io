class Matrix

  attr_reader :rows, :columns

  def initialize matrix_str
    @rows    = matrix_str.each_line              # split rows by newlines
                .map { |r| r.split.map(&:to_i) } # nested arrays of integers
    @columns = rows.transpose
  end

end
