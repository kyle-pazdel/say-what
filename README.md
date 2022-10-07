# SayWhat


<p align="center" dir="center">
  <img src="https://raw.githubusercontent.com/kyle-pazdel/say-what/main/app/assets/images/dashboard.png" alt="" width="70%" >
</p>

SayWhat is simple messaging app that allows users to create profiles and send messages to eachother on one dashboard style page.

### Dependencies

SayWhat was created with Ruby 3.1.1 on Rails 7.0.4. on a postgreSQL server, and makes use of both the [bcrypt gem](https://github.com/bcrypt-ruby/bcrypt-ruby) and the [shrine gem](https://github.com/shrinerb/shrine).


## Installation

This app is currently in development, but can be cloned and run on a local server.

Navigate to your desired directory and use command,
```bash
  git clone https://github.com/kyle-pazdel/say-what.git
```
then bundle install all dependencies with,
```bash
  bash/bundle install
```

### Executing program

To execute a local instance of Bark BnB start a rails server with
```bash
bash/rails server
```
and in your browser navigate to the default Rails server location **http://localhost:3000**

run the following commands to create a rails database and migrate.
```bash
  bash/rails db:create

  bash/rails db:migrate
```

### Features
• User create and destroy
• User profile updates including avatar image saved to db via the shrine app
• User authentication
• Users can send and receive messages to eachother
• Users can destroy conversations


## Author

<p>
  <a href="https://github.com/kyle-pazdel">Kyle Pazdel</a>
</p>



