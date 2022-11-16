require_relative '../games/game'

describe Game do
  before :each do
    @game = Game.new('GTA', 'n', 4, 'ROCKSTAR', 'GAMES')
  end
  describe 'creating a new game' do
    it 'will create a new game' do
      expect(@game).to be_a Game
    end
  end
  describe 'checks if a game can be archived' do
    it 'It should return true if archived is true and last_played_at is greater than 2' do
      expect(@game.can_be_archived?).to be(true)
    end
  end
end
