class Team < ApplicationRecord
  
  has_many :users
  has_many :games, dependent: :destroy
  has_many :matchs, :through => :games
  
  
  def winrate
    #Initialize matchs for current team
    matchs       = self.matchs.distinct
    total_matchs = self.matchs.distinct.count
    win_match    = 0
    
    #Iterate through all matchs, increase win_match if winner is "self"
    matchs.each do  |match|
      win_match += 1 if match.winner == self
    end
    #Rule out zero divider exception, convert result to float rounded to 3
    total_matchs == 0 ? 0.0 : (win_match.to_f/total_matchs).round(3)
  end
  
  
  
end
