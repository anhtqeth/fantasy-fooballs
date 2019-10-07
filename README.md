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

### Notable Method

Below method used to calculate Winrate of a team. Return result is a float.
This number is later used to calculate the percentage.
~~~~
#team.rb
def winrate
    #Initialize matchs for current team
    matchs       = self.matchs.distinct
    total_matchs = self.matchs.distinct.count
    win_match    = 0
    
    #Iterate through all matchs, increase win_match if winner is "self"
    matchs.each do  |match|
      win_match += 1 if match.winner == self
    end
    #Rule out zero divider exception, convert result to float rounded to 3
    total_matchs == 0 ? 0.0 : (win_match.to_f/total_matchs).round(3)
  end
 
#On view that show winrate
<td><h5><span class="badge badge-pill badge-warning"><%=number_to_percentage(t[:winrate] * 100, precision: 0) %></span></h5></td>
~~~~

- Ranked List
I want to keep the initial reqs with the less change as possible (Team attribute is name and users) So the below method was used to return a ranked list base on winrate of team. 
~~~~
def self.ranked_list
    ranked_list = []
    #Iterate Over teams, create an array of hashes contain winrate
    Team.all.each do |team|
      team_result = {:team=>nil, :wins=> nil,
      :losses => nil,:total_match=>nil,:winrate=>nil}
      
      total_match = team.matchs.distinct.count
      wins        = (total_match * team.winrate).to_i
      losses      = total_match - wins
      team_result.store(:team, team)
      team_result.store(:total_match,total_match)
      team_result.store(:wins,wins)
      team_result.store(:losses,losses)
      team_result.store(:winrate,team.winrate)
      ranked_list << team_result
    end
    #Descending sorting
    ranked_list.sort_by {|k| k[:winrate] }.reverse
  end
~~~~

# Improvements 
- Pagination can be added for Team/Users/Match index page
- Ajax can be added at some page to dynamically show team ranking. 
- An authentication module can be integrated so only admin can edit team/match/records
- Model Design can be rework as I was followed the rule (Game can only has a score attribute)
- As score of each team is recorded under the db. This stat can be used to analyze the Team's performance on a deeper manner.
- We can also check the detail match and game score of each team.
- Testing Data in Rspec is repeating. I did not used gem like FactoryGirl to setup test data, hence some of the rspec model testing used duplicate data creation. 

# Rails & Ruby Version 

- [Rails 5.2.3](https://rubygems.org/gems/rails/versions/5.2.3)
- [Ruby v 2.4.1](https://www.ruby-lang.org/en/news/2017/03/22/ruby-2-4-1-released/)

# Gem Used
For full list of gems used, please refer to gemfile inside the project

- [Rspec](https://rubygems.org/gems/rspec) For TDD development
- [Rspec Rails](https://rubygems.org/gems/rspec-rails) For TDD development
- [Shoulda](https://rubygems.org/gems/shoulda) For easier of writing association test
- [Faker](https://rubygems.org/gems/faker) Generate Random Name
- [Bootstrap](https://getbootstrap.com/) A usable UI 

# Built with

- Developed on [AWS Cloud9](https://aws.amazon.com/cloud9/)

# Database creation
Initial Database has been done through
rails db:seed
Faker was used to randomize Team Name and User's name.

# Deployment instructions

Already deployed to [Heroku](https://foosballs.herokuapp.com/) 

While it technically can work on a mobile device. I found a bug when open the above url on a phone. The header menu will dissapear. For the best viewing experience, please open it on your computer's browser.
