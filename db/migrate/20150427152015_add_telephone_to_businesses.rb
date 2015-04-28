class AddTelephoneToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :telephone, :string
  end
end
