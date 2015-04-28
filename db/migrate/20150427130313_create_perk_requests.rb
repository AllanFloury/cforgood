class CreatePerkRequests < ActiveRecord::Migration
  def change
    create_table :perk_requests do |t|
      t.references :user, index: true
      t.references :perk, index: true

      t.timestamps null: false
    end
    add_foreign_key :perk_requests, :users
    add_foreign_key :perk_requests, :perks
  end
end
