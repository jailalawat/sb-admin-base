class EditStatusColumInUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :status, :string
    add_column :users, :status, :integer, :default => 0, :null => false
  end
end
