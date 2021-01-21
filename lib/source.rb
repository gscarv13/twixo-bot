require 'telegram/bot'
require 'net/http'
require 'json'
require 'dotenv'
# require_relative 'bot'

Dotenv.load('token_source.env')

class Source
  attr_reader :listing

  NEWS_API = ENV['TOKEN_SOURCE']

  def initialize
    @listing = nil
  end
end
