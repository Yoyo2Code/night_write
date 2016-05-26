require './lib/braille_formatter'
require './lib/braille_translator'
require './lib//character_seperator'
require './lib/dictionary'
require './lib/english_formatter'
require './lib/exporter'


  class NightReader
    attr_reader :reader,
                :input_file

    def initialize
      @input_file = ARGV[0]
    end

    def translate
      reader = Reader.new(input_file)

      words = CharacterSeperator.new(reader.read)
      characters = words.translate_to_english(words.plain)

      # translator = EnglishTranslator.new(characters)
      # braille = translator.translate_to_english(translator.characters)

      formatter = EnglishFormatter.new(characters)
      english_output = formatter.lines_of_80(formatter.english)

      exporter = Exporter.new(english_output)
      # binding.pry
      exporter.export
    end
  end

  if __FILE__ == $0
    writer = NightReader.new
    writer.translate
  end
