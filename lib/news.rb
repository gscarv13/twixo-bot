require 'telegram/bot'
require 'net/http'
require 'json'
require 'dotenv'

Dotenv.load('token.env')

class News
  NEWS_API = secrets.SOURCE
  @url = nil

  def output(source)
    define_url(source)
    json = retrieve_json
    array = parse_json(json, nil)
    return array if array.nil?

    create_message(array)
  end

  private

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

  def parse_json(res, status)
    hash = JSON.parse(res)
    return status if hash['articles'].empty?

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
end
