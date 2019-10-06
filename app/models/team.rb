class Team < ApplicationRecord
  validates :name, presence: true,uniqueness: true
  validates :user_id, uniqueness: true
  has_many :users
  has_many :games, dependent: :destroy
  has_many :matchs, :through => :games
  
  validate :validate_max_users
  
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
  
  def self.ranked_list
    ranked_list = []
    
    Team.all.each do |team|
      team_result = {:team=>nil, :wins=> nil,
      :losses => nil,:total_match=>nil,:winrate=>nil}
      
      total_match = team.matchs.distinct.count
      wins        = (total_match * team.winrate).to_i
      losses      = total_match - wins
      team_result.store(:team, team)
      team_result.store(:total_match,total_match)
      team_result.store(:wins,wins)
      team_result.store(:losses,losses)
      team_result.store(:winrate,team.winrate)
      ranked_list << team_result
    end
    ranked_list.sort_by {|k| k[:winrate] }.reverse
  end
  
  
  
  private
    def validate_max_users
     if self.users.size > 2
      errors[:base] << "Team can only has maximum of two users"
     end
    end

  
  
end
