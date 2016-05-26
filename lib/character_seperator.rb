require './lib/dictionary'
require 'pry'

class CharacterSeperator
  attr_reader :plain,
              :new_english_words

  include Dictionary

  def initialize(plain)
    @plain = plain
  end

  def seperate_plain_text(plain)
    plain.chars
  end

  def seperate(input)
    input.split("\n")
  end

  def three_lines_of_braille(braille)
    seperated_braille = []
    characters = seperate(braille)
    until characters.count == 0
      seperated_braille << characters.slice!(0..2)
    end
    seperated_braille
  end

  def seperate_words(braille)
    lines = three_lines_of_braille(braille)
    @new_english_words = lines.map do |line|
      words = []
      line.map do |second_line|
        words << second_line.slice!(0..1)
      end
    end
  end
end

if __FILE__ == $0
  character_seperator = CharacterSeperator.new("..0..0\n..000.\n.0...\n...0..0\n..000.\n.0....")

  character_seperator.three_lines_of_braille(character_seperator.plain)
  binding.pry
  # character_seperator.make_braille_characters(characters)
end
