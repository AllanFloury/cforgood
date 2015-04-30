class RemoveStateFromPerks < ActiveRecord::Migration
  def change
    remove_column :perks, :state
  end
end
