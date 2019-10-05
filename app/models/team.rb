class Team < ApplicationRecord
  has_many :users
  has_many :games, dependent: :destroy
  has_many :matchs, :through => :games
end
