class Game < ApplicationRecord
  validates :score, presence: true
  validates_inclusion_of :score, :in => 0..10
  has_many :matchs
  has_many :teams, :through => :matchs
  
  
  
end
