require './app'

class Operations
  def initialize
    @app = App.new
  end

  def list_options
    puts 'Welcome to your own Catalogue of things'
    puts 'Choose an option from below:
    1 - List all books
    2 - List all music albums
    3 - List of games
    4 - List all labels
    5 - List all authors
    6 - List all genres
    7 - Add a book
    8 - Add a music album
    9 - Add a game
    10 - Quit
    '
    # opt = enter_option
    # choose_method(opt)
  end

  def run
    loop do
      list_options
      opt = enter_option
      if opt.between?(1, 6)
        choose_method(opt)
      elsif opt.between?(7, 9)
        add_item(opt)
      elsif opt == 10
        puts 'Thank you for using our App'
        exit
      else
        puts 'Wrong choice, try again!'
      end
    end
  end

  def enter_option
    print 'Enter option (1 - 10): '
    gets.chomp.to_i
  end

  def choose_method(option)
    case option
    when 1
      @app.list_books
    when 2
      @app.list_music_albums
    when 3
      @app.list_all_games
    when 4
      @app.list_label
    when 5
      @app.list_all_authors
    when 6
      @app.list_genres
    end
  end

  def add_item(opt)
    case opt
    when 7
      @app.add_books
    when 8
      @app.add_music_album
    when 9
      @app.add_game
    end
  end
end
