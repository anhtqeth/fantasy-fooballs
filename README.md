# Fantasy Foosballs App

Record result and track team winning performance of a foosballs (Table Football) game.

## Description

Record result and track team winning performance of a foosball games. Home page will show team ranking base on the winrate (Percentage) of the team. Updated whenever new match is added. 

## Current Features

- Manage Users (Create/Edit/View All User)
- Manage Teams (Create/Edit/View All Team)
- Manage Matches (Create/View All Matches)
- Check Team Ranking and Winrate at Home Page.
- Basic Validation (User empty name/ Team with 3 users/ Matches with same team error)

### Side notes on rules

I personally don't know the official Foosballs rule. The project is implemented with the following assumption:

- Each Match will have 3 Games (Highest)
- Each side (team) will have a score from 0 - 10 on each Game
- At the end of the game, whoever has the higher score will win the game. 
- Team will be the winner when they win 2 out of 3 Games. 


### Development Notes

- TDD was followed in the Model Method section. From the Controller and View layer, I stopped writing Test first.
Reasons? It was time consuming for a small app to test the navigation while the main thing to check mostly is the params. 

- For Controller, I used byebug debugger to set a break point and examine the params submitted.

- The heroku app was deployed with preexisting data from db:seed. This is to see the full webapp in motion. If run on an empty data set, there will be error. 

# Improvements 
- Pagination can be added for Team/Users/Match index page
- An authentication module can be integrated so only admin can edit team/match/records
- Model Design can be rework as I was followed the rule (Game can only has a score attribute)
- As score of each team is recorded under the db. This stat can be used to analyze the Team's performance on a deeper manner.
- We can also check the detail match and game score of each team.

# Rails & Ruby Version 

- [Rails 5.2.3](https://rubygems.org/gems/rails/versions/5.2.3)
- Ruby v 2.4.1p111

# Gem Used
For full list of gems used, please refer to gemfile inside the project

- [Rspec](https://rubygems.org/gems/rspec)
- [Rspec Rails](https://rubygems.org/gems/rspec-rails)
- [Shoulda](https://rubygems.org/gems/shoulda)
- [Faker](https://rubygems.org/gems/faker)
- [Bootstrap](https://getbootstrap.com/)

# Built with

- Developed on [AWS Cloud9](https://aws.amazon.com/cloud9/)

# Database creation
Initial Database has been done through
rails db:seed
Faker was used to randomize Team Name and User's name.

# Deployment instructions

Already deployed to [Heroku](https://foosballs.herokuapp.com/) 

While it technically can work on a mobile device. I found a bug when open the above url on a phone. The header menu will dissapear. For the best viewing experience, please open it on your computer's browser.
