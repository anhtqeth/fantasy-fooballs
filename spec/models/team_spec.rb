require 'rails_helper'

RSpec.describe Team, type: :model do
  subject { described_class.new(name: 'Team A')}
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid 
  end

  
end
