class Exporter

  def initialize(text)
    @text = text
  end

  def export
    File.write(ARGV[1], "#{@text}")
  end
end
