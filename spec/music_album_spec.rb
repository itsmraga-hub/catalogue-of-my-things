require_relative '../musicAlbum/music_album'

describe MusicAlbum do
  context 'When testing the MusicAlbum class' do
    it 'Should create a new MusicAlbum instance with passed properties' do
      m = MusicAlbum.new('Love song', true, 2022)
      expect(m.name).to eq 'Love song'
      expect(m.on_spotify).to eq true
      expect(m.publish_date).to eq 2022
    end

    it 'testing can_be_archived? method' do
      m = MusicAlbum.new('hate song', false, 2022)
      expect(m.can_be_archived?).to eq false
      m_two = MusicAlbum.new('another song', true, 2002)
      expect(m_two.can_be_archived?).to eq true
      m_three = MusicAlbum.new('November rain', false, 2022)
      expect(m_three.can_be_archived?).to eq false
    end
  end
end
