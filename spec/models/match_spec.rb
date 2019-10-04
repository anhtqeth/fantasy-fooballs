require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'associations' do
    it { should have_many(:games)}
    it { should have_many(:teams).through(:games) }
  end
  
end
