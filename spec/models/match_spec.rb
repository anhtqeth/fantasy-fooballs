require 'rails_helper'

RSpec.describe Match, type: :model do
  subject { described_class.new}
  
  describe 'associations' do
    it { should have_many(:games)}
    it { should have_many(:teams).through(:games) }
  end
  
  it "must not have more than two team" do
    
  end
  
  it "must not have more than three games" do
    
  end
  
  it "must return a winner" do 
  
  end
  
end
