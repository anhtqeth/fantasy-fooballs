require 'rails_helper'

RSpec.describe Match, type: :model do
  subject { described_class.new}
  #This is copied from seed, as I need to test the winner method with some test data
  #FactoryGirl can be used to set these up, but I don't wanna spend time set it up.
  before(:each) do
  
    5.times do
      User.create(first_name: Faker::Name.first_name, 
      last_name: Faker::Name.last_name)
    end

    Team.destroy_all
      2.times do
      team      = Team.new
      team.name = Faker::Team.name
      team.users << User.all.sample
      team.users << User.all.sample
      team.save
    end

    Match.destroy_all
      1.times do 
      match = Match.create
    end
    
    Game.destroy_all
    #Create a Match with three games
    3.times do
      match = Match.first
      teamA = Team.first
      teamB = Team.second
      game = Game.create(score: [*0..10].sample,team: teamA, match: match)
      game = Game.create(score: [*0..10].sample,team: teamB, match: match)
    end
  end
  
  describe 'associations' do
    it { should have_many(:games)}
    it { should have_many(:teams).through(:games) }
  end
  
  it "must return a winner by team" do 
    match = Match.first
    result = match.winner
    expect(result).not_to be_nil
    expect(result).to be_an_instance_of(Team)
    #expect(result).to be == Team.first
  end
  
end
