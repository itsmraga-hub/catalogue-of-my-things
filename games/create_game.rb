require_relative './choices'
require_relative './implement_choice'

module CreateGame
  def add_game
    print 'Name of Game: '
    name_of_game = gets.chomp.to_s
    print 'Is the game multiplayer [y/n]: '
    multiplayer = gets.chomp.to_s
    print 'How many years since the last time you played: '
    last_played_at = gets.chomp.to_s
    print 'First Name of the Author: '
    first_name = gets.chomp.to_s
    print 'Last Name of the Author: '
    last_name = gets.chomp.to_s

    case multiplayer
    when 'y'
      multiplayer = 'Yes'
      game = Game.new(name_of_game, multiplayer, last_played_at, first_name, last_name)
      author = Author.new(first_name, last_name)
      @games.push(game)
      @authors.push(author)

      when_yes
    when 'n'
      multiplayer = 'No'
      game = Game.new(name_of_game, multiplayer, last_played_at, first_name, last_name)
      author = Author.new(first_name, last_name)
      @games.push(game)
      @authors.push(author)

      when_no
    else
      puts 'Invalid Input...'
    end
  end
end
