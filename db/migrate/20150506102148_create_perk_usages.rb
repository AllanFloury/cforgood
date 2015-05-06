class CreatePerkUsages < ActiveRecord::Migration
  def change
    create_table :perk_usages do |t|
      t.references :user, index: true
      t.references :perk, index: true

      t.timestamps null: false
    end
    add_foreign_key :perk_usages, :users
    add_foreign_key :perk_usages, :perks
  end
end
