require './lib/dictionary'
require 'pry'

class CharacterSeperator
  attr_reader :plain,
              :new_english_words,
              :braille_dictionary,
              :number_dictionary

  include Dictionary

  def initialize(plain)
    @plain = plain
    @braille_dictionary = DICTIONARY.invert
    @number_dictionary = NUMBERS.invert
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
    lines.map do |line|
      line.map do |second_line|
        second_line.scan(/../)
      end
    end
  end

    def make_words(braille)
      line = seperate_words(braille)
      line.map do |one|
        one.transpose
      end
    end

  def translate_to_english(english_word)
    capital = false
    number = false
    braille_lines = make_words(english_word)
    braille_lines.map do |line_1|
        line_1.map do |word|
        if word == ["..","..",".0"]
          capital = true
          nil
        elsif capital == true
          capital = false
          letter = braille_dictionary[word]
          letter.capitalize
        elsif word == [".0",".0","00"]
          number = true
          nil
        elsif number == true
          number_dictionary[word]
        else
          braille_dictionary[word]
        end
      end
    end
  end
end


if __FILE__ == $0
  character_seperator = CharacterSeperator.new("..00.0.0..00.0.0000...0\n0000...0.0..0....0..00\n0.0.00..00.........00.")

  character_seperator.seperate_words(character_seperator.plain)
  binding.pry
end
