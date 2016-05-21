class CharacterSeperator
  attr_reader :plain

  def initialize(plain)
    @plain = plain
  end

  def seperate_plain_text
    characters = plain.chars
  end
end
