class UsersController < ApplicationController
  
  def index
    @users = User.all
    
    @user =  User.new
    if @user.save
    
    else
     
    end
    
  end
   
  # def create
  #   @user = User.new 
    
  # end
  
    
  def edit
    @user = User.find(params[:id])
  end
  
  def show
  
  end

  def update

  end
  
  def destroy
  
  end

end
