# Fantasy Fooballs App

Record result and track team winning performance of a foosball games.

## Description

Record result and track team winning performance of a foosball games. Home page will show team ranking base on the winrate (Percentage) of the team. Updated whenever new match is added. 

# Features

- Manage Users (Create/Edit/View All User)
- Manage Teams (Create/Edit/View All Team)
- Manage Matches (Create/View All Matches)
- Check Team Ranking and Winrate

* Rails & Ruby Version 
- [Rails 5.2.3](https://rubygems.org/gems/rails/versions/5.2.3)
- Ruby v 2.4.1p111

# Gem used for testing
For full list of gems used, please refer to gemfile inside the project

- [Rspec](https://rubygems.org/gems/rspec)
- [Rspec Rails](https://rubygems.org/gems/rspec-rails)
- [Shoulda](https://rubygems.org/gems/shoulda)
- [Faker](https://rubygems.org/gems/faker)

# Database creation
Initial Database has been done through
rails db:seed
Faker was used to randomize Team Name and User's name

# Deployment instructions

Deployed to [Heroku](https://foosballs.herokuapp.com/) 
While it technically can work on a mobile device. I found a bug when open the above url on a phone. The header menu will dissapear. For the best viewing options, please open it on your computer's browser.
