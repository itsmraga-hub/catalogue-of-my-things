require 'json'

class Persist
  def initialize(path)
    @path = path
  end

  def save(arr)
    File.write(@path, JSON.pretty_generate(arr).to_s)
  end

  def load
    return [] unless File.exist?(@path)

    file = File.read(@path)
    return [] if file.empty?

    JSON.parse(file)
  end
end
