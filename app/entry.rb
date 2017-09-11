class Entry
  attr_reader :path, :ip_address

  def initialize(data)
    @path, @ip_address = data.split(' ')
  end
end