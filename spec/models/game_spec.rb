require 'rails_helper'

RSpec.describe User, type: :model do
   subject { described_class.new(score: 8)}
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid 
  end
  
  it "is not valid without score" do
    subject.score = nil
    expect(subject).not_to be_valid 
  end
  
  
  
end
