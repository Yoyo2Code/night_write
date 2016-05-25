class Exporter
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def export
    File.write(ARGV[1], "#{@text}")
  end
end
