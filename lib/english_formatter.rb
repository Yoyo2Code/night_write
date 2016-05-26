require './lib/character_seperator'
require 'pry'

class EnglishFormatter
  attr_accessor :capital,
                :number,
                :characters

  include Dictionary

  def initialize
    @capital = false
    @number = false
  end

  def check_for_special(input)
    if input == [".0",".0","00"]
      translate_numbers(input)
    elsif input == ["..","..",".0"]
      translate_to_braille(input)
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
    elsif english_word != "shift" || "#"
      translate_to_braille(english_word)
    else
      raise(ArgumentError, ":Not readable")
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
