class UsersController < ApplicationController
  
    
  def index
    @users = User.all
    @user =  User.new(params[:user])
  end

  
  def create
    @user =  User.new(user_params)
    if @user.save
      redirect_back(fallback_location: users_path)
    else
     
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def show
  
  end

  def update

  end
  
  def destroy
    User.find(params[:id]).destroy
    flash.now[:success] = "User Deleted!"
    redirect_back(fallback_location: users_path)
  end
  
  private
  def user_params
      params.require(:user).permit(:first_name, :last_name)
  end

end
