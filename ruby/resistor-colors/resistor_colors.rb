class ResistorColors

  COLOR_VALUE_MAP = { black: 0,
                      brown: 1,
                      red: 2,
                      orange: 3,
                      yellow: 4,
                      green: 5,
                      blue: 6,
                      violet: 7,
                      grey: 8,
                      white: 9 }

  def self.value colors
    colors.map { |c| COLOR_VALUE_MAP[c.downcase.to_sym] }.join.to_i
  end

end
