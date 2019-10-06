require 'rails_helper'

RSpec.describe Team, type: :model do
  subject { described_class.new(name: 'Team A')}
  
  describe 'associations' do
    it { should have_many(:matchs).through(:games) }
    it { should have_many(:users)}
  end
  
  describe 'validations' do 
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:user_id) }
    it {should validate_presence_of(:name)}
  end
  
  it 'limt the number of users' do
    subject.users << User.create(first_name: 'Anh',last_name: 'Truong')
    subject.users << User.create(first_name: 'Anh',last_name: 'Truong')
    subject.users << User.create(first_name: 'Anh',last_name: 'Truong')
    expect(subject.save).not_to be true
  end
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid 
  end
  
  it "can return winrate" do 
    expect(subject.winrate).not_to be_nil
    expect(subject.winrate).to be_instance_of(Float)
  end
  
  it "can show team and winrate list" do
    ranked_list = Team.ranked_list
    expect(ranked_list).not_to be_empty
    expect(ranked_list.first.winrate).to be_instance_of(Float)
    expect(ranked_list.first.wins).to be_instance_of(Integer)
    expect(ranked_list.first.losess).to be_instance_of(Integer)
    expect(ranked_list.first.name).to be_instance_of(String)
  end

end
