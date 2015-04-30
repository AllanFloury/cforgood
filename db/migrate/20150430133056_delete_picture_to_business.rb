class DeletePictureToBusiness < ActiveRecord::Migration
  def change
    remove_column :businesses, :picture, :string
    remove_column :users, :picture, :string
  end
end
