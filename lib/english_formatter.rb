require './lib/dictionary'
require 'pry'

class EnglishFormatter
  attr_accessor :english,
                :length

  include Dictionary

  def initialize(english)
    @english = english
  end

  def count(english)
    english.count
  end

  def lines_of_80(english)
    sentence = english.flatten.join
    sentence.length > 80 ? sentence.scan((/.{1,#{80}}/)).join("\n") : sentence
  end
end

if __FILE__ == $0
  word = ["H", "i", ",", " ", "H", "o", "w", " ", "A", "r", "e", " ", "y", "o", "U", "?"]
  formatter = EnglishFormatter.new(word)
  binding.pry
end
