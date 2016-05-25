require './lib/braille_formatter'
require './lib/braille_translator'
require './lib//character_seperator'
require './lib/dictionary'
require './lib/english_formatter'
require './lib/exporter'


class NightReader
  attr_reader :input_file

  def initialize
    @input_file = ARGV[0]
  end


end
