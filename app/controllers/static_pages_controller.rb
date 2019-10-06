class StaticPagesController < ApplicationController
  
  def home
    @ranked_list = Team.all
    
    
    render 'home'
  end
  
  
end
