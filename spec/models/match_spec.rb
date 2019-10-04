require 'rails_helper'

RSpec.describe Match, type: :model do
  subject { described_class.new}
  before(:each) do
    @match = Match.create
  end
  
  describe 'associations' do
    it { should have_many(:games)}
    it { should have_many(:teams).through(:games) }
  end
  
  it "must return a winner by team" do 
    #teamA [10, 0, 6]
    #teamB [1, 6, 6]
    teamA = Team.first
    teamB = Team.second
    game = Game.create(score: [*0..10].sample,team: teamA, match: @match)
    game = Game.create(score: [*0..10].sample,team: teamB, match: @match)
    
    result = @match.winner
    expect(result).not_to be_nil
    expect(result).to be_an_instance_of(Team)
    expect(result).to be == Team.first
  end
  
end
