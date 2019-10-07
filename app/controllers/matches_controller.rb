class MatchesController < ApplicationController
  def index
    @matches     = Match.all
    @match       = Match.new
    @score_range = *(0..10)
  end
  
  def create
    @match = Match.new
    #This is a technical debt
    #If both team id are the same >> not save the match
    unless teamA_params[:id] == teamB_params[:id]
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
    else
      flash[:danger] = "Same Team cannot fight each other!"
      redirect_back(fallback_location: matches_path)
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
