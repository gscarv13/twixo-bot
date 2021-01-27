require 'telegram/bot'
require 'dotenv'
require_relative 'news'

Dotenv.load('token.env')

class Bot < Telegram::Bot::Client
  system 'echo BipBop initializing...'
  system 'echo To terminate the process press CTRL + Z'

  @token = 'ADD_BOT_TOKEN_HERE'
  @obj = News.new
  @cmd = '====================================='\
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
        @obj.print_details(bot, message, 'wired', @cmd)

      when '/techcrunch'
        @obj.print_details(bot, message, 'techcrunch', @cmd)

      when '/theverge'
        @obj.print_details(bot, message, 'the-verge', @cmd)

      when '/tnw'
        @obj.print_details(bot, message, 'the-next-web', @cmd)

      when '/techradar'
        @obj.print_details(bot, message, 'techradar', @cmd)

      else
        bot.api.send_message(
          chat_id: message.chat.id, text: "I haven't learned that yet hehe."\
          'Please enter one of the following: /start,  /stop , /wired, /techcrunch, /theverge, /tnw or /techradar'
        )
      end
    end
  end
end
