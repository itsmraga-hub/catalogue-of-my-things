require_relative '../musicAlbum/genre'
require_relative '../musicAlbum/music_album'

describe MusicAlbum do
  context 'When testing the Genre class' do
    it 'Should create a new Genre instance with passed properties' do
      genre = Genre.new('Rock Music')
      expect(genre.name).to eq 'Rock Music'
    end
  end

  context 'When testing the Genre class method add_item' do
    it 'Should add a music instance to music_album_items' do
      genre = Genre.new('Rock Music')
      m = MusicAlbum.new('Love song', true, 2022)
      genre.add_item(m)
      expect(genre.music_album_items.length).to eq 1
      expect(genre.music_album_items[0]).to eq m
      m_two = MusicAlbum.new('Love song', true, 2022)
      genre.add_item(m_two)
      expect(genre.music_album_items.length).to eq 2
      expect(genre.music_album_items[1]).to eq m_two
    end
  end
end
