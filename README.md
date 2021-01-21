![](https://img.shields.io/badge/Microverse-blueviolet)

# Twixo - The Technology News Bot

![screenshot](./assets/img/smartmockups.png)

Twixo is a Telegram bot that can give you updates on the top latest technology news from Techcrunch, TheNextWeb, The Verge, Techradar and Wired.

## Built With

- Ruby
- Telegram Bot API
- News API

<!-- ## Live Demo

Visit the live version on the link above.

[link]() -->


## Getting Started

- Install ruby language on your machine [here](https://www.ruby-lang.org/en/downloads/)
- Create a Telegram account [here](https://web.telegram.org/#/login) 
- Create a Telegram bot [here](https://t.me/botfather) Click on 'Send Messege' and enter `/start`, then `/newbot` and follow the instructions
- Save Token, it will used in the next steps.
- Create an account at [newsapi.org](https://newsapi.org/) and save the API code.

- Use `git clone https://github.com/gscarv13/twixo-bot.git`
- Move to the directory where the project was cloned to. 
- Install the dependencies with
```terminal
$ bundle install
```
- Open the `lib/news.rb` file and change the line 9:
 ```ruby
  NEWS_API = 'ADD_NEWS_API_HERE'
 ```
- Open the `lib/bot.rb` file and change the line 9:
 ```ruby
  @token = 'ADD_BOT_TOKEN_HERE'
 ```
- Finally run your bot with from the root directory with the command
```terminal
$ ruby bin/main.rb
```

## Authors

👤 **Gustavo Carvalho**

- GitHub: [@gscarv13](https://github.com/gscarv13)
- Twitter: [@Gscarv13](https://twitter.com/Gscarv13)
- LinkedIn: [Gustavo Carvalho](https://www.linkedin.com/in/gustavo-silva-de-carvalho-72998a156/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to leave your suggestion on the [issues page](https://github.com/gscarv13/HTML-CSS-Capstone/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](https://opensource.org/licenses/mit-license.php) licensed.
