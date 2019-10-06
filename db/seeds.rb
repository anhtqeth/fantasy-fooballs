# User.destroy_all
# 5.times do
#   User.create(first_name: Faker::Name.first_name, 
#   last_name: Faker::Name.last_name)
# end

# Team.destroy_all
# 2.times do
#   team      = Team.new
#   team.name = Faker::Team.name
#   team.users << User.all.sample
#   team.users << User.all.sample
#   team.save
# end

# Match.destroy_all
# 1.times do 
#   Match.create
# end
# Game.destroy_all
# #Create a Match with three games
# 3.times do
#   match = Match.first
#   teamA = Team.first
#   teamB = Team.second
#   game  = Game.create(score: [*0..10].sample,team: teamA, match: match)
#   game  = Game.create(score: [*0..10].sample,team: teamB, match: match)
# end

User.destroy_all
Team.destroy_all
Match.destroy_all
Game.destroy_all

40.times do
  User.create(first_name: Faker::Name.first_name, 
  last_name: Faker::Name.last_name)
end

x = 0
10.times do
  team      = Team.new
  team.name = Faker::Team.name
  team.users << User.all[x]
  team.users << User.all[x+=1]
  team.save
  x+=1
end

5.times do 
  Match.create
end

i = 0
Match.all.each do |match|
  3.times do
    teamA = Team.all[i]
    teamB = Team.all[i+1]
    game  = Game.create(score: [*0..10].sample,team: teamA, match: match)
    game  = Game.create(score: [*0..10].sample,team: teamB, match: match)
  end
  i+=2
end



