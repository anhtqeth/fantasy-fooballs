require 'rails_helper'

RSpec.describe Game, type: :model do
   subject { described_class.new(score: 8)}
  
  describe 'associations' do
    it { should have_many(:teams).through(:matchs) }
    #it { should belong_to(:match).class_name('Match') }
  end
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid 
  end
  
  it "is not valid without score" do
    subject.score = nil
    expect(subject).not_to be_valid 
  end
  
  it "is not valid if score greater than 10" do
    subject.score = 15
    expect(subject).not_to be_valid 
  end
  
  it "is not valid if score lower than 0" do
    subject.score = -1
    expect(subject).not_to be_valid 
  end
  
end
