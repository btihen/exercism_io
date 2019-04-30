class Matrix
  attr_reader :rows, :columns

  def initialize matrix_string
    @rows    = matrix_string.split(/\n/).map { |row| row.split.map {|e| e.to_i } }
    max_len  = rows.map(&:length).max
    @columns = rows.map { |e| e.values_at(0...max_len).map { |e| (e.nil? ? " " : e) } }.transpose
  end

  def saddle_points
    row_max_points & col_min_points
  end

  private

  def row_max_points
    row_collection = []
    rows.each_with_index do |row,ridx|
      max_val      = row.max
      row.each_with_index { |e, cidx| row_collection << [ridx, cidx] if e == max_val }
    end.compact
    row_collection
  end

  def col_min_points
    col_collection = []
    columns.each_with_index do |col,cidx|
      min_val      = col.min
      col.map.with_index { |e, ridx| col_collection << [ridx, cidx] if e == min_val }.compact
    end
    col_collection
  end

end
