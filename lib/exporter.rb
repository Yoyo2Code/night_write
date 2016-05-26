class Exporter
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def export
    File.write(ARGV[1], "#{@text}")
    # puts "Created '#{@export_file}' containing #{text.count} characters"
  end
end
