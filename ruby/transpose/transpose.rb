class Transpose

  def self.transpose input
    return "" if input.eql? ""

    # input.split("\n").map{ |r| r.chars }.transpose.map { |row| [row.join] }.join("\n")
    rows   = input.split("\n")        # split by line
                  .map{ |r| r.chars } # break string into array of chars
    maxlen = rows.map(&:length).max

    rows.map{|e| e.values_at(0...maxlen)            # make all rows same length
                  .map { |e| (e.nil? ? " " : e) } } # convert nil to " "
        .transpose                 # transpose the matrix - now that its safe
        .map { |row| [row.join] }  # turn transposed row elements into a string
        .join("\n").strip          # join rows with a line return (and make a string)
  end

end
