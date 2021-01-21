require 'telegram/bot'
require 'dotenv'
require_relative 'news'

Dotenv.load('token.env')

class Bot
  @token = ENV['BOT']
  @src = News.new
  @cmd = '================================================'\
              "\n That's it! I'm ready for the next command 🚀"

  Telegram::Bot::Client.run(@token) do |bot|
    bot.listen do |message|
      case message.text
      when '/start'
        bot.api.send_message(
          chat_id: message.chat.id, text: "Welcome, #{message.from.first_name}! 👋 I am Twixo the technology"\
          'news bot 🤖. I can bring the top 📰 headlines from /wired, /techcrunch, /theverge, /tnw or /techradar'\
          "\n To begin pick up one of the options."\
          "\n To stop, please run /stop at any time."
        )

      when '/stop'
        bot.api.send_message(
          chat_id: message.chat.id, text: "See you soon, #{message.from.first_name}", date: message.date
        )

      when '/wired'
        bot.api.send_message(chat_id: message.chat.id, text: @src.output('wired') + @cmd, date: message.date)

      when '/techcrunch'
        bot.api.send_message(chat_id: message.chat.id, text: @src.output('techcrunch') + @cmd, date: message.date)

      when '/theverge'
        bot.api.send_message(chat_id: message.chat.id, text: @src.output('the-verge') + @cmd, date: message.date)

      when '/tnw'
        bot.api.send_message(chat_id: message.chat.id, text: @src.output('the-next-web') + @cmd, date: message.date)

      when '/techradar'
        bot.api.send_message(chat_id: message.chat.id, text: @src.output('techradar') + @cmd, date: message.date)

      else
        bot.api.send_message(
          chat_id: message.chat.id, text: "I haven't learned that yet hehe.
          Please enter one of the following: /start,  /stop , /wired, /techcrunch, /theverge, /tnw or /techradar"
        )
      end
    end
  end
end
