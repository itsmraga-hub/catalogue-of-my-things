require_relative '../musicAlbum/music_album'

describe MusicAlbum do
  context 'When testing the MusicAlbum class' do
    it 'Should create a new MusicAlbum instance with passed properties' do
      m = MusicAlbum.new('Love song', true, 2022)
      expect(m.name).to eq 'Love song'
      expect(m.on_spotify).to eq true
      expect(m.publish_date).to eq 2022
    end
  end
end
