# rubocop: disable Metrics/BlockLength

require 'telegram/bot'
require 'dotenv'
require_relative 'news'

Dotenv.load('token.env')

class Bot < Telegram::Bot::Client
  system 'echo BipBop initializing...'
  system 'echo To terminate the process enter CTRL + Z'

  @token = ENV['BOT']
  @obj = News.new
  @cmd = '================================================'\
          "\n That's it! I'm ready for the next command 🚀"
  # @print = @obj.print_news(@src)

  Telegram::Bot::Client.run(@token) do |bot|
    bot.listen do |message|
      case message.text
      when '/start'
        bot.api.send_message(
          chat_id: message.chat.id, text: "Welcome, #{message.from.first_name}! 👋 I am Twixo the technology"\
          'news bot 🤖. I can bring the top 📰 headlines from /wired, /techcrunch, /theverge, /tnw or /techradar'\
          "\n To begin pick up one of the options. Use /stop when you're done"\
        )

      when '/stop'
        bot.api.send_message(
          chat_id: message.chat.id, text: "See you soon, #{message.from.first_name}", date: message.date
        )

      when '/wired'
        array = @obj.output('wired')
        array.length.times do |i|
          bot.api.send_message(chat_id: message.chat.id, text: array[i].join("\n"), date: message.date)
        end
        bot.api.send_message(chat_id: message.chat.id, text: @cmd, date: message.date)

      when '/techcrunch'
        array = @obj.output('techcrunch')
        array.length.times do |i|
          bot.api.send_message(chat_id: message.chat.id, text: array[i].join("\n"), date: message.date)
        end
        bot.api.send_message(chat_id: message.chat.id, text: @cmd, date: message.date)

      when '/theverge'
        array = @obj.output('the-verge')
        array.length.times do |i|
          bot.api.send_message(chat_id: message.chat.id, text: array[i].join("\n"), date: message.date)
        end
        bot.api.send_message(chat_id: message.chat.id, text: @cmd, date: message.date)

      when '/tnw'
        array = @obj.output('the-next-web')
        array.length.times do |i|
          bot.api.send_message(chat_id: message.chat.id, text: array[i].join("\n"), date: message.date)
        end
        bot.api.send_message(chat_id: message.chat.id, text: @cmd, date: message.date)

      when '/techradar'
        array = @obj.output('techradar')
        array.length.times do |i|
          bot.api.send_message(chat_id: message.chat.id, text: array[i].join("\n"), date: message.date)
        end
        bot.api.send_message(chat_id: message.chat.id, text: @cmd, date: message.date)

      else
        bot.api.send_message(
          chat_id: message.chat.id, text: "I haven't learned that yet hehe."\
          'Please enter one of the following: /start,  /stop , /wired, /techcrunch, /theverge, /tnw or /techradar'
        )
      end
    end
  end
end

# rubocop: enable Metrics/BlockLength
