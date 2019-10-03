require 'rails_helper'

RSpec.describe User, type: :model do
   subject { described_class.new(first_name: "Johny",
    last_name: "Cage")
  }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid 
  end
  
end
