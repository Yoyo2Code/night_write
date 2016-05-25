require 'pry'

class CharacterSeperator
  attr_reader :plain

  def initialize(plain)
    @plain = plain
  end

  def seperate_plain_text(plain)
    plain.chars
  end

  def seperate(input)
    input.split("\n")
  end

  # def seperate_brail(braille)
  #   lines = braille.seperate
  #   lines.each do |line|
  #
  #   end
  # end
end

if __FILE__ == $0
  character_seperator = CharacterSeperator.new("..0..0\n..000.\n.0....")

  characters = character_seperator.seperate(character_seperator.plain)
  binding.pry
end
