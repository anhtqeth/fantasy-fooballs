class Match < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :teams, :through => :games
  
  #Determine the winner of the match
  def winner
    #Get both team of the match
    teamA          = self.teams.distinct.first
    teamB          = self.teams.distinct.second
    #Setup win counting for each team
    teamA_wincount = 0
    teamB_wincount = 0
    #Get Game result for the match Each team will have score for each game
    teamA_rs       = Game.where(team_id: teamA.id,match_id: self.id).map{|x| x.score}
    teamB_rs       = Game.where(team_id: teamB.id,match_id: self.id).map{|x| x.score}
    i              = 0
    games_count    = self.games.count/2
    #Looping through result, compare result from both side 
    games_count.times do
      if teamA_rs[i] > teamB_rs[i]
        teamA_wincount +=1
      else
        teamB_wincount +=1
      end
      i+=1
    end
    #Return result base on wincount
    teamA_wincount > teamB_wincount ? teamA : teamB
  end
  
end
