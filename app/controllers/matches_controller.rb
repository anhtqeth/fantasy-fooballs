class MatchesController < ApplicationController
  def index
    @matches     = Match.all
    @match       = Match.new
    @score_range = *(0..10)
  end
  
  def create
    #TODO - Prevent same team match
    @match = Match.create
    teamA_params[:scores].each do |k, v|
      Game.create(score: v,team: Team.find(teamA_params[:id]), match: @match)
    end
    
    teamB_params[:scores].each do |k, v|
      Game.create(score: v,team: Team.find(teamB_params[:id]), match: @match)
    end
    
    if @match.save
      redirect_back(fallback_location: matches_path)
    else
      
    end
  end
  
  def show
  
  end
  
  def update

  end
  
  def destroy
    Match.find(params[:id]).destroy
    flash.now[:success] = "Match Deleted!"
    redirect_back(fallback_location: matches_path)
  end
  
  private 
    def teamA_params
      params.require(:teamAgames).permit(:id, { scores: [:game1, :game2, :game3]})
    end
    
    def teamB_params
      params.require(:teamBgames).permit(:id, { scores: [:game1, :game2, :game3]})
    end
  
  
end
