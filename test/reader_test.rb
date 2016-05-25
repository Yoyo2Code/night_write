require 'minitest/autorun'
require 'minitest/pride'
require './lib/reader'

class ReaderTest < Minitest::Test

  def setup
    ARGV = "messages.txt"
    message[0] = ARGV
  end

  def test_argv_input
    reader = Reader.new
    assert_equal "messages.txt", message
  end

  # def test_reader_reads_files

end
