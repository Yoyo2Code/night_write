require './lib/character_seperator'
require 'pry'

class EnglishTranslator
  attr_reader :characters

  def initialize(characters)
    @characters = characters
  end
#
#   def translate_to_english(english_word)
#     capital = false
#     number = false
#     braille_lines = CharacterSeparator.make_words(english_word)
#     braille_lines.map do |line_1|
#       line_1.map do |word|
#         if word == ["..","..",".0"]
#           capital = true
#           nil
#         elsif capital == true
#           capital = false
#           letter = braille_dictionary[word]
#           letter.capitalize
#         elsif word == [".0",".0","00"]
#           number = true
#         elsif number == true
#           number_dictionary[word]
#         else
#           braille_dictionary[word]
#         end
#       end
#     end
#   end
end
