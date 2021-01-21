require 'telegram/bot'
require 'net/http'
require 'json'
require 'dotenv'

Dotenv.load('token.env')

class News
  NEWS_API = ENV['SOURCE']
  @url = nil

  def define_url(topic)
    @url = 'http://newsapi.org/v2/top-headlines?'\
    "sources=#{topic}&"\
    "apiKey=#{NEWS_API}"
    @url
  end

  def retrieve_json
    uri = URI(@url)
    Net::HTTP.get(uri)
  end

  def parse_json(res)
    hash = JSON.parse(res)
    hash['articles']
  end

  def create_message(headings)
    message = []
    loops = headings.length

    loops.times do |index|
      message += [headings[index]['title'], headings[index]['url'], "\n"]
    end

    message.join(" \n ")
  end

  def output_message(source)
    define_url(source)
    json = retrieve_json
    filter = parse_json(json)
    create_message(filter)
  end
end
