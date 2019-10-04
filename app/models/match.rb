class Match < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :teams, :through => :games
 
  def winner
    teamA = self.teams.distinct.first
    teamB = self.teams.distinct.second
    teamA_wincount = 0
    teamB_wincount = 0
    
    teamA_rs = Game.where(team_id: teamA.id).map{|x| x.score}
    teamB_rs = Game.where(team_id: teamB.id).map{|x| x.score}
    
    i = 0
    3.times do
      if teamA_rs[i] > teamB_rs[i]
        teamA_wincount +=1
      else
        teamB_wincount +=1
      end
      i+=1
    end
    teamA_wincount > teamB_wincount ? teamA : teamB
  end
  
end
