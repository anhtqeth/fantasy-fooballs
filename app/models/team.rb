class Team < ApplicationRecord
  has_many :users
  has_many :games, dependent: :destroy
  has_many :matchs, :through => :games
  
  
  def winrate
    total_matchs      = self.matchs.distinct
    win_match   = 0
    
    total_matchs.each do  |match|
      win_match += 1 if match.winner = self
    end
    
  end
  
end
