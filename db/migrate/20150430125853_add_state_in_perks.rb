class AddStateInPerks < ActiveRecord::Migration
  def change
    add_column :perks, :state, :boolean, default: false
  end
end
