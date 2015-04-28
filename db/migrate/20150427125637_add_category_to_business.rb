class AddCategoryToBusiness < ActiveRecord::Migration
  def change
    add_reference :businesses, :category, index: true
    add_foreign_key :businesses, :categories
  end
end
