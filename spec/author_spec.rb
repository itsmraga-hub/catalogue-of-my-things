require_relative '../authors/author'
require_relative '../games/game'

describe Author do
  before :each do
    @author = Author.new('Christian', 'Raga')
  end

  describe 'creating a new author' do
    it 'will create Author' do
      expect(@author).to be_a Author
    end
  end

  describe 'assign the correct first name' do
    it 'first name' do
      expect(@author.first_name).to eq('Christian')
    end
  end

  describe 'assign the correct last name' do
    it 'last name' do
      expect(@author.last_name).to eq('Raga')
    end
  end

  describe 'test add_item method' do
    it 'add_method function will' do
      game = Game.new('FIFA', 'yes', 5, 'William', 'Raga')
      @author.add_item(game)
      expect(@author.items.length).to eq 1
      game_two = Game.new('FIFA', 'yes', 5, 'William', 'Raga')
      @author.add_item(game_two)
      expect(@author.items.length).to eq 2
    end
  end
end
