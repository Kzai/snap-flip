class AddUserIdToSnaps < ActiveRecord::Migration
  def change
    add_column :snaps, :user_id, :integer
    add_index :snaps, :user_id
  end
end
