require_relative '../authors/author'

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
end
