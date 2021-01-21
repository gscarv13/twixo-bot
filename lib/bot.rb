require 'telegram/bot'
require 'dotenv'
require_relative 'source'

Dotenv.load('token.env')

class Bot
  @token = ENV['BOT']

  Telegram::Bot::Client.run(@token) do |bot|
    bot.listen do |message|
      case message.text
      when '/start'
        bot.api.send_message(
          chat_id: message.chat.id, text: "Welcome, #{message.from.first_name}! I am Twixo the technology news bot."\
          'I will bring the top 7 articles from the following sources, /wired, /techcrunch, /theverge, /tnw or /techradar.'\
          'To begin /start to run the bot, and choose one of the options.'\
          'To stop, please run /stop at any time.'
        )

      when '/stop'
        bot.api.send_message(
          chat_id: message.chat.id, text: "See you soon, #{message.from.first_name}", date: message.date
        )

      when '/wired'
        bot.api.send_message(chat_id: message.chat.id, text: @source.output_message('wired'), date: message.date)

      when '/techcrunch'
        bot.api.send_message(chat_id: message.chat.id, text: 'tech works', date: message.date)

      when '/theverge'
        bot.api.send_message(chat_id: message.chat.id, text: 'business works', date: message.date)

      when '/tnw'
        bot.api.send_message(chat_id: message.chat.id, text: 'wallstreet works', date: message.date)

      when '/techradar'
        bot.api.send_message(chat_id: message.chat.id, text: 'wallstreet works', date: message.date)

      else
        bot.api.send_message(
          chat_id: message.chat.id, text: "I haven't learned that yet hehe.
          Please enter one of the following: /start,  /stop , /bitcoin, tech, /wallstreet or /business"
        )
      end
    end
  end
end
