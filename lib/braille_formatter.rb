require 'pry'

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
    results.join("\n")
  end

  def split_characters_by_160(braille)
      braille.length > 161 ? braille << braille.slice!(160..-1) : braille.join("\n")
      end
  end

if __FILE__ == $0
  formatter = Formatter.new([["..", "..", ".0"], ["0.", "00", ".."], [".0", ".0", "00"], ["0.", "00", ".."], ["0.", "0.", "0."]])
  formatter.make_three_lines(formatter.braille)
  binding.pry
end
