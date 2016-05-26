require './lib/braille_formatter'
require './lib/braille_translator'
require './lib//character_seperator'
require './lib/dictionary'
require './lib/english_formatter'
require './lib/english_translator'
require './lib/exporter'
require './lib/reader'
require 'pry'

class BrailleTranslator
  attr_reader :characters,
              :inputting_numbers,
              :braille

  include Dictionary

  def initialize(characters)
    @characters = characters
    @braille = []
    @inputting_numbers = false
  end

  def english_to_braille
    @characters.each do |plain|
      if capital_letter?(plain)
        insert_capital(plain)
      elsif start_numbers?(plain)
        start_numbers(plain)
      elsif input_more_numbers?(plain)
        translate_number(plain)
      elsif stop_number_input(plain)
        stop_numbers(plain)
      elsif inputting_numbers == false
        translate_character(plain)
      end
    end
    braille
  end

  def capital_letter?(input)
    input =~ /[A-Z]/ && inputting_numbers == false ? true : false
  end

  def start_numbers?(input)
    input =~ /[0-9]/ && inputting_numbers == false ? true : false
  end

  def input_more_numbers?(input)
    input =~ /[0-9]/ && inputting_numbers == true ? true : false
  end

  def start_numbers(input)
    putting_numbers
    start_number_insert(input)
  end

  def stop_number_input(input)
    if input !~ /[0-9]/ && inputting_numbers == true
      true
    end
  end

  def stop_numbers(input)
    not_putting_in_numbers
    after_numbers(input)
  end

  def putting_numbers
    @inputting_numbers = true
  end

  def not_putting_in_numbers
    @inputting_numbers = false
  end

  def after_numbers(letter)
    if letter =~ /[A-Z]/ && inputting_numbers == false
      braille << DICTIONARY["shift"]
      braille << DICTIONARY[letter.downcase]
    else
      braille << DICTIONARY[letter]
    end
  end

  def insert_capital(letter)
    braille << DICTIONARY["shift"]
    braille << DICTIONARY[letter.downcase]
  end

  def start_number_insert(number)
    braille << NUMBERS["#"]
    braille << NUMBERS[number]
  end

  def translate_character(character)
    braille << DICTIONARY[character]
  end

  def translate_number(character)
    braille << NUMBERS[character]
  end
end


if __FILE__ == $0
  braille = BrailleTranslator.new(["H","8","l"])
  p braille.english_to_braille
end
