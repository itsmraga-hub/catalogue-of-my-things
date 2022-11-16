require_relative './create_game'

def implement_choice
  games_list = @file_games.load
  authors_list = @file_authors.load
  @games.each do |g|
    games_list << {
      name_of_game: g.name_of_game,
      multiplayer: g.multiplayer,
      last_played_at: g.last_played_at,
      first_name: g.first_name,
      last_name: g.last_name
    }
  end
  @authors.each do |a|
    authors_list << {
      first_name: a.first_name,
      last_name: a.last_name
    }
  end
  @games = []
  @authors = []
  @file_authors.save(authors_list)
  @file_games.save(games_list)
  puts 'Game created successfully'
end
