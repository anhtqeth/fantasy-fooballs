require 'rails_helper'

RSpec.describe User, type: :model do
   subject { described_class.new(first_name: "Johny",
    last_name: "Cage")
  }
  
  it { expect(subject).to have_many(:games).through(:match) }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid 
  end
  
  it "is not valid without first name" do
    subject.first_name = nil
    expect(subject).not_to be_valid 
  end
  
  it "is not valid without last name" do
    subject.last_name = nil
    expect(subject).not_to be_valid 
  end
  
  
  # it "should have many game through match" do
  #   expect(subject).to have_many(:games).through(:match) 
  # end
  
  #TODO Add scope for full name?
  
end
