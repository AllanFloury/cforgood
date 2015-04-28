class AddCoordinatesToPerks < ActiveRecord::Migration
  def change
    add_column :perks, :latitude, :float
    add_column :perks, :longitude, :float
  end
end
