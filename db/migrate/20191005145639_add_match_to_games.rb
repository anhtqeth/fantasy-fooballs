class AddMatchToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :match, foreign_key: true
  end
end
