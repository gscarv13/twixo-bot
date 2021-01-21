require_relative '../lib/news'
require 'dotenv'

Dotenv.load('token.env')

API = ENV['SOURCE']

describe News do
  # Variables
  general_obj = News.new

  let(:wired_url) do
    wired_url = News.new
    wired_url.define_url('wired')
  end

  let(:url) do
    tnw_url = News.new
    tnw_url.define_url('the-next-web')
  end

  let(:json) do
    tnw = News.new
    tnw.define_url('the-next-web')
    tnw.retrieve_json
  end

  let(:array) do
    tnw = News.new
    tnw.define_url('the-next-web')
    json = tnw.retrieve_json
    tnw.parse_json(json)
  end

  let(:message) do
    tnw = News.new
    tnw.define_url('the-next-web')
    json = tnw.retrieve_json
    array = tnw.parse_json(json)
    tnw.create_message(array)
  end

  describe '#define_url' do
    it 'Should contain the API' do
      expect(general_obj.define_url('the-verge').include?(API)).to be true
    end

    it 'Should return a string' do
      expect(wired_url.class).to eq(String)
    end

    it 'Should include the input' do
      expect(wired_url.include?('wired')).to be true
    end

    it 'The return length should be 89 when wired is passed in' do
      expect(wired_url.length).to eq(89)
    end
  end

  describe '#retrieve_json' do
    it 'Return should be a string' do
      expect(general_obj.retrieve_json.class).to be String
    end

    it 'Return should be greater than 5000' do
      expect(general_obj.retrieve_json.length).to be >= 5000
    end
  end

  describe '#parse_json' do
    it 'Should return an Array' do
      expect(array.is_a?(Array)).to be true
    end
  end

  describe '#create_message' do
    it 'Should not return an Array' do
      expect(message.class).not_to be Array
    end

    it 'Should return a String' do
      expect(message.class).to be String
    end
  end

  describe '#output_message' do
    it 'Length should be 1000 or more' do
      expect(message.length).to be >= 1000
    end
  end
end
