require 'minitest/autorun'
require 'minitest/pride'
require './lib/exporter'

class ReaderTest < Minitest::Test

  def test_exporter_input
    exporter = Exporter.new("message.txt")
    assert_equal "message.txt", exporter.text
  end
end
