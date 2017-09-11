require 'spec_helper'

RSpec.describe FileParser do
  describe 'initialize' do
    it 'create Entry object' do
      entry = Entry.new(log_line)

      expect(entry.path).to eq('path1')
      expect(entry.ip_address).to eq('ip1')
    end
  end

  def log_line
    'path1 ip1'
  end
end
