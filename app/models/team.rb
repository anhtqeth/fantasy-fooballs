class Team < ApplicationRecord
  has_many :users
  has_many :matchs
  has_many :games, :through => :matchs
  
end
