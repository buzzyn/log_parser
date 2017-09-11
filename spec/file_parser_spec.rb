require 'spec_helper'

RSpec.describe FileParser do
  let(:file_parser) { FileParser.new('foo/bar') }

  describe 'read_file' do
    it 'read log file, iterates over log lines' do
      allow(File).to receive(:read).and_return(log_lines)
      file_parser.read_file

      expect(file_parser.entries.size).to eq(5)
    end
  end

  describe 'ordered_pages_views' do
    it 'order logs by most viewed' do
      allow(File).to receive(:read).and_return(log_lines)
      file_parser.read_file
      ordered = file_parser.ordered_pages_views

      expect(ordered.size).to eq(3)
      expect(ordered).to match_array(expected_ordered_result)
    end
  end

  describe 'ordered_unique_page_views' do
    it 'order logs by most unique viewed' do
      allow(File).to receive(:read).and_return(log_lines)
      file_parser.read_file
      ordered = file_parser.ordered_unique_page_views

      expect(ordered.size).to eq(3)
      expect(ordered).to match_array(unique_ordered_result)
    end
  end

  describe 'grouped_paths' do
    it 'group log entries by paths' do
      allow(File).to receive(:read).and_return(log_lines)
      file_parser.read_file
      grouped_paths = file_parser.send(:grouped_paths)

      expect(grouped_paths).to include('path1')
    end
  end

  def log_lines
    "path1 ip1\npath2 ip2\npath1 ip3\npath1 ip1\npath1\\1 ip1"
  end

  def expected_ordered_result
    [ ["path1", 3],
      ["path1\\1", 1],
      ["path2", 1]
    ]
  end

  def unique_ordered_result
    [ ["path1", 2],
      ["path1\\1", 1],
      ["path2", 1]
    ]
  end
end
