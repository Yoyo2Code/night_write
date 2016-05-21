class Reader
  attr_reader :read

  def initialize
    file_name = ARGV[0]
    @read = File.read(file_name)
  end
end
