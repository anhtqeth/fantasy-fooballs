class TeamsController < ApplicationController
  def index
    @teams = Team.all.order('created_at desc')
  end
  
  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "Team Added!"
      redirect_to teams_path
    else
      render 'new'
    end
  end
  
  def new
    @team = Team.new
  end
  
  
  def show
  
  end
  
  def edit
    @team = Team.find(params[:id])
  end
  
  def update
    @team = Team.find(params[:id])
    
    if @team.update_attributes(team_params)
      flash[:success] = "Team Updated!"
      redirect_to teams_path
    else
      render 'new'
    end
  end
  
  def destroy
    Team.find(params[:id]).destroy
    flash.now[:success] = "Team Deleted!"
    redirect_back(fallback_location: teams_path)
  end
  
  private
  def team_params
      params.require(:team).permit(:name, user_ids: [])
  end
  
end
