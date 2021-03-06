class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :street, :string
    add_column :users, :zipcode, :string
    add_column :users, :city, :string
    add_column :users, :picture, :string
  end
end
