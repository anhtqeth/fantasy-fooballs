class MatchesController < ApplicationController
  def index
    @matches = Match.all
    @match   = Match.new(params[:team])
    @score_range = [0..10]
  end
  
  def show
  
  end
  
  def update

  end
  
  def destroy
  
  end
end
