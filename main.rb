require_relative './app'
@app = App.new

require './operations'

@operations = Operations.new

def main
  @operations.run
end

main
