class AddUserToColloc < ActiveRecord::Migration
  def change
    add_column :collocs, :user_id, :integer
  end
end
