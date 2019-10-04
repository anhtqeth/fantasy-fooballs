class Match < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :teams, :through => :games
 
  def winner
    
  end
  
end
