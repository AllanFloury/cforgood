class AddAuthenticateToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :authenticate, :boolean, default: false
  end
end
