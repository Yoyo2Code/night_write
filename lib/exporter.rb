class Exporter
  attr_reader :text,
              :export_file

  def initialize(text)
    @text = text
    @export_file = ARGV[1]
  end

  def export
    File.write(ARGV[1], "#{@text}")
    puts "Created '#{@export_file}' containing #{text.count} characters"
  end
end
