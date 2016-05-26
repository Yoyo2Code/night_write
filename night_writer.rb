require './lib/braille_formatter'
require './lib/braille_translator'
require './lib//character_seperator'
require './lib/dictionary'
require './lib/english_formatter'
require './lib/english_translator'
require './lib/exporter'
require './lib/reader'
require 'pry'


class NightWriter
  attr_reader :reader,
              :input_file

  def initialize
    @input_file = ARGV[0]
  end

  def translate
    reader = Reader.new(input_file)

    words = CharacterSeperator.new(reader.read)
    characters = words.seperate_plain_text(words.plain)

    translator = BrailleTranslator.new(characters)
    braille = translator.english_to_braille

    formatter = Formatter.new(braille)
    braille_output = formatter.braille_lines(braille)

    exporter = Exporter.new(braille_output)
    # binding.pry
    exporter.export
  end
end

if __FILE__ == $0
  writer = NightWriter.new
  writer.translate
end
