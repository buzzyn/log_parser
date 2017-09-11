require_relative 'entry'

class FileParser
  attr_reader :log_file, :entries

  def initialize(log_file)
    @log_file = log_file
    @entries = []
  end

  def read_file
    File.read(log_file).each_line do |line|
      construct_entry(line)
    end
  end

  def ordered_pages_views
    grouped_paths.map { |key, value| [key, value.count] }.sort_by {|k, v| v}.reverse
  end

  def ordered_unique_page_views
      grouped_paths.map { |key, value| [key, value.map(&:ip_address).uniq.count] }.sort_by {|k, v| v}.reverse
  end

  private

  def construct_entry(line)
    @entries << Entry.new(line)
  end

  def grouped_paths
    @grouped_paths ||= entries.group_by { |entry| entry.path }
  end
end