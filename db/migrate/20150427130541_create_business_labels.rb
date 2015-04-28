class CreateBusinessLabels < ActiveRecord::Migration
  def change
    create_table :business_labels do |t|
      t.references :business, index: true
      t.references :label, index: true

      t.timestamps null: false
    end
    add_foreign_key :business_labels, :businesses
    add_foreign_key :business_labels, :labels
  end
end
