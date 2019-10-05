class TeamsController < ApplicationController
  def index
    @teams = Team.all
    @team  =  Team.new(params[:team])
  end
  
  def create
    @team     = Team.new
    @team.name = team_params[:name]
    team_params[:users].each do |k, v|
      @team.users << User.find(v)
    end
    @team.save
    if @team.save
      redirect_back(fallback_location: teams_path)
    else
     
    end
  end
  
  def show
  
  end
  
  def update

  end
  
  def destroy
    Team.find(params[:id]).destroy
    flash.now[:success] = "Team Deleted!"
    redirect_back(fallback_location: teams_path)
  end
  
  private
  def team_params
      params.require(:team).permit(:name, { users: [:user1, :user2] })
  end
  
end
