require 'pry'

class Proverb

  def initialize *wants, qualifier: nil
    @wants     = wants
    @qualifier = qualifier
    @proverb   = build_proverb
  end

  def to_s
    proverb
  end

  private

  attr_reader :wants, :proverb, :qualifier

  def build_proverb
    stop = wants.count - 1
    wants.map.with_index do |want, index|
      get_phrase index, stop
    end.compact.join("\n")
  end

  def get_phrase index, stop
    return "And all for the want of a #{qualifier} #{wants[0]}." if index >= stop && qualifier
    return "And all for the want of a #{wants[0]}."              if index >= stop

    "For want of a #{wants[index]} the #{wants[index+1]} was lost."
  end

end
