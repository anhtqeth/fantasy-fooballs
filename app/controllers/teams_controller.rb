class TeamsController < ApplicationController
  def index
    @teams = Team.all
    @team  =  Team.new(params[:team])
  end
  
  def create
    @team      =  Team.new
    @team.name = team_params[:name]
    puts 'CONTROLERR TEST'
    puts params[:users]
    puts User.find_by(params[:users][:user1]).first_name
    puts User.find_by(params[:users][:user2]).first_name
    puts params[:users][:user1].is_a? Integer
    @team.users << User.find_by(params[:users][:user1])
    @team.users << User.find_by(params[:users][:user2])
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
