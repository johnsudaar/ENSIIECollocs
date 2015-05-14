class AddCollocsToUser < ActiveRecord::Migration
  def change
    add_reference :users, :colloc, index: true, foreign_key: true
    add_column :users, :c_admin, :boolean
    add_column :users, :accepted, :boolean
  end
end
