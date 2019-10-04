require 'rails_helper'

RSpec.describe Team, type: :model do
  subject { described_class.new(name: 'Team A')}
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid 
  end

  it "should has users" do 
    t = Team.reflect_on_association(:users)
    expect(t.macro).to eq(:has_many)
  end
  
    
  it "should have many game through match" do
    expect(subject).to have_many(:games).through(:match) 
  end
  
end
