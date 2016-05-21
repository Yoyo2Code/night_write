require 'minitest/autorun'
require 'minitest/pride'
require './lib/reader'

class ReaderTest < Minitest::Test

  def test_argv_input
    reader = Reader.new
    assert_equal "messages.txt", ARGV[0]
  end

  def test_reader_reads_files

end
