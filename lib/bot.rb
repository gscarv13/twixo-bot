require 'telegram/bot'
require 'dotenv'
require_relative 'source'

Dotenv.load('token_bot.env')

class Bot
  @token = ENV['TOKEN_BOT']

  Telegram::Bot::Client.run(@token) do |bot|
    bot.listen do |message|
      case message.text
      when '/start'
        bot.api.send_message(
          chat_id: message.chat.id, text: "Welcome, #{message.from.first_name}! I am Twixo the news bot.
          I will bring the top 7 articles on four different categories, /bitcoin, /tech, /wallstreet or/business.
          To begin /start to run the bot, and choose one of the options.
          To stop, please run /stop at any time."
        )

      when '/stop'
        bot.api.send_message(
          chat_id: message.chat.id, text: "See you soon, #{message.from.first_name}", date: message.date
        )

      when '/bitcoin'
        bot.api.send_message(chat_id: message.chat.id, text: 'bitcoin works', date: message.date)

      when '/tech'
        bot.api.send_message(chat_id: message.chat.id, text: 'tech works', date: message.date)

      when '/business'
        bot.api.send_message(chat_id: message.chat.id, text: 'business works', date: message.date)

      when '/wallstreet'
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
