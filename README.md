# SayWhat

![Dashboard screenshot](https://raw.githubusercontent.com/kyle-pazdel/say-what/main/app/assets/images/dashboard.png)

SayWhat is simple messaging app running with Ruby 3.1.1 on Rails 7.0.4 that allows users to create profiles and send messages to eachother on one dashboard style page.

## Installation

This app is currently in development, but can be cloned and run on a local server.

navigate to your desired directory and use command
```bash
  git clone https://github.com/kyle-pazdel/say-what.git
```
then bundle install all dependencies with
```bash
  bundle install
```

run the following commands to create a rails database, migrate.
```bash
  rails db:create

  rails db:migrate
```

### Features
• User create and destroy
• User profile updates including avatar image saved to db via the shrine app
• User authentication
• Users can send and receive messages to eachother
• Users can destroy conversations

