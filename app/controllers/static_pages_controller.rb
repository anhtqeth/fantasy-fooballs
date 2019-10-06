class StaticPagesController < ApplicationController
  
  def home
    @ranked_list = Team.ranked_list
    
    
    render 'home'
  end
  
  
end
