require 'rails_helper'

RSpec.describe Team, type: :model do
  subject { described_class.new(name: 'Team A')}
  
  describe 'associations' do
    it { should have_many(:matchs).through(:games) }
    it { should have_many(:users)}
  end
  
  describe 'validations' do 
    it { should validate_uniqueness_of(:name) }
    it {should validate_presence_of(:name)}
  end
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid 
  end
  
  it "can return winrate" do 
    expect(subject.winrate).not_to be_nil
    expect(subject.winrate).to be_instance_of(Float)
  end

end
