class Game < ApplicationRecord
  validates :score, presence: true
  validates_inclusion_of :score, :in => 0..10
  
end
