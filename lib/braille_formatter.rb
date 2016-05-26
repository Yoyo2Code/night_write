require './lib/braille_translator'

class Formatter
  attr_reader :braille


  def initialize(braille)
    @braille = braille
  end

  def braille_lines(input)
    lines = make_three_lines(input)
    split_characters_by_160(lines)
  end

  def make_three_lines(braille)
    line_1 = ""
    line_2 = ""
    line_3 = ""
    results = []

    braille.each do |character|
      line_1.concat(character[0])
      line_2.concat(character[1])
      line_3.concat(character[2])
    end
    results << line_1 << line_2 << line_3
    return results
  end

  def split_characters_by_160(braille)
    braille.each do |line|
      if line.length > 161
        braille << line.slice!(160..-1)
      end
    end
    braille.join("\n")
  end
end
