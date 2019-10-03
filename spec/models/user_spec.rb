require 'rails_helper'

RSpec.describe User, type: :model do
   subject { described_class.new(first_name: "Johny",
    last_name: "Cage")
  }
  
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
  
end
