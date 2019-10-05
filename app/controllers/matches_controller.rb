class MatchesController < ApplicationController
  def index
    @matches = Match.all
    @match   = Match.new(params[:team])
    @score_range = *(0..10)
  end
  
  def create
    @match =  Match.new
    
    #teamA_result = params[:teamAgames]
    teamA_score = params[:teamAscores]
    teamB_score = params[:teamBscores]
    
    teamA_score.each do |score|
      Game.create(score: score,team: Team.find(params[:teamAgames][:id]), match: @match)
    end
    
    teamB_score.each do |score|
      Game.create(score: score,team: Team.find(params[:teamBgames][:id]), match: @match)
    end
    
    #Params is team and match id
    # Match.create(params[:match])
    # Game.create(params[:games])
    #Create game with nested attribute
    #Game.create(score: [*0..10].sample,team: teamA, match: match)
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
  
  end
  
  private
    
end
