class Reader
  attr_reader :file_name

  def initialize(file)
    @file_name = file
  end

  def read
    File.read(file_name).chomp
  end
end
