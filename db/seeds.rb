User.destroy_all
5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end
Team.destroy_all
2.times do
  team = Team.new
  team.name = Faker::Team.name
  team.users << User.all.sample
  team.users << User.all.sample
  team.save
end