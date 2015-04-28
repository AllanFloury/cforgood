class CreatePerks < ActiveRecord::Migration
  def change
    create_table :perks do |t|
      t.string :title
      t.text :details
      t.string :state
      t.references :business, index: true

      t.timestamps null: false
    end
    add_foreign_key :perks, :businesses
  end
end
