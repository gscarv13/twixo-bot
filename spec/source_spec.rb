require_relative '../lib/news'
require 'dotenv'

Dotenv.load('token.env')

describe News do
  # Variables
  let(:news) { News.new }

  describe '#output' do
    it 'Raise ArgumentError if no input is passed in' do
      expect { news.output }.to raise_exception ArgumentError
    end
    it 'Invalid input should return nil' do
      expect(news.output('my-news-website')).to be nil
    end
    it 'Invalid input should return nil' do
      expect(news.output('3215487942513')).to be nil
    end
    it 'Invalid input should return nil' do
      expect(news.output('aomnetiolcn&ig%30ds821f-djh942513')).to be nil
    end
    it 'Valid source should not be nil' do
      expect(news.output('wired')).to be_truthy
    end
    it 'Valid source should not be nil' do
      expect(news.output('the-verge')).to be_truthy
    end
    it 'Valid source should not be nil' do
      expect(news.output('techcrunch')).to be_truthy
    end
    it 'Valid source should not be nil' do
      expect(news.output('techradar')).to be_truthy
    end
    it 'Valid source should not be nil' do
      expect(news.output('the-next-web')).to be_truthy
    end
  end
end
