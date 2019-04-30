class Bob

  def self.hey(remark)
    return "Fine. Be that way!"                if remark.strip.empty?
    return "Calm down, I know what I'm doing!" if shouting?(remark) && question?(remark)
    return "Whoa, chill out!"                  if shouting?(remark)
    return "Sure."                             if question?(remark)

    "Whatever."
  end

  private

  def self.shouting?(remark)
    remark.eql?(remark.upcase) && remark.match(/[a-zA-Z]/)
  end

  def self.question?(remark)
    remark.strip.chars.last.eql?("?") #&& remark.match(/[a-zA-Z]/)
  end

end
