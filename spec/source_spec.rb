require_relative '../lib/news'
require 'dotenv'

Dotenv.load('token.env')

NEWS_API = ENV['SOURCE']

describe News do
  # Variables
  let(:news) { News.new }

  describe '#output' do
    it 'Raise ArgumentError in no input is passed in' do
      expect { news.output }.to raise_exception ArgumentError
    end
    it 'Invalid input should return nil' do
      expect(news.output('my-news-website')).to be nil
    end
    it 'Length should be 1000 or more' do
      expect(news.output('wired').length).to be >= 1000
    end
  end
end
