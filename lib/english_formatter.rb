require './lib/braille_formatter'
require './lib/braille_translator'
require './lib//character_seperator'
require './lib/dictionary'
require './lib/english_formatter'
require './lib/english_translator'
require './lib/exporter'
require './lib/reader'
require 'pry'

class EnglishFormatter
  attr_accessor :capital,
                :number,
                :characters

  include Dictionary

  def initialize(characters)
    @capital = false
    @number = false
    @characters = characters
  end

  def check_for_special(input)
    if input == [".0",".0","00"]
      translate_to_braille(input)
    elsif input == ["..","..",".0"]
      translate_numbers(input)
    end
  end

  def translate_to_english(english_word)
    if english_word == "shift"
      capital = true
    elsif capital == true
      capital = false
      translate_to_braille(english_word)
    elsif english_word == "#"
      number = true
    elsif number == true
      translate_numbers(english_word)
    else
      translate_to_braille(english_word)
    end
  end

  def make_words(braille)
    lines = seperate_words(braille)
    lines.map do |line|
      line.map do |word|
        braille_characters = check_for_special(word)
        translate_to_english(braille_characters)
      end
    end
  end
end

if __FILE__ == $0
  word = [["00","0.","0."], ["00","0.","0."], ["00","0.","0."]]
  formatter = EnglishFormatter.new(word)
  binding.pry
end
