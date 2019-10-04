class Team < ApplicationRecord
  has_many :users
  has_many :games
  has_many :matchs, :through => :games
end
