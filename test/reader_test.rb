require 'minitest/autorun'
require 'minitest/pride'
require './lib/reader'

class ReaderTest < Minitest::Test

  def test_argv_input
    reader = Reader.new("messages.txt")
    assert_equal "messages.txt", reader.file_name
  end
end
