require_relative '../lib/source'
require 'dotenv'

Dotenv.load('token.env')

API = ENV['SOURCE']

describe Source do
  # Variables
  let(:tnw_url) do
    tnw_url = Source.new
    tnw_url.define_url('the-next-web')
  end

  let(:wired_url) do
    wired_url = Source.new
    wired_url.define_url('wired')
  end

  describe '#define_url' do
    it 'Should contain the API' do
      expect(wired_url.include?(API)).to be true
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

  # describe '#retrieve_json' do
  #   it ''
  # end
  # describe '#filter_json' do

  # end
  # describe '#create_message' do

  # end
  # describe '#output_message' do

  # end
end
