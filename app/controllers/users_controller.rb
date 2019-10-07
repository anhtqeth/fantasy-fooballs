class UsersController < ApplicationController
  
    
  def index
    @users = User.all.order('created_at desc')
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user =  User.new(user_params)
    if @user.save
      flash[:success] = "User Added!"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def show
    
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "User updated!"
      redirect_to users_path
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted!"
    redirect_back(fallback_location: users_path)
  end
  
  private
  def user_params
      params.require(:user).permit(:first_name, :last_name)
  end

end
