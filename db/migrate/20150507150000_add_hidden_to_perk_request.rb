class AddHiddenToPerkRequest < ActiveRecord::Migration
  def change
    add_column :perk_requests, :hidden, :boolean
  end
end
