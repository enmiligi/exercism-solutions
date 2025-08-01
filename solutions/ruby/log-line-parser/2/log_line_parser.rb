class LogLineParser
  def initialize(line)
    @line = line
  end
  
  def message
    @line[@line.index(': ') + 2, @line.size - 1].strip
  end

  def log_level
    @line[@line.index('[') + 1, @line.index(']') - 1].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
