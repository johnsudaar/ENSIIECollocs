class PrepareToManyMany < ActiveRecord::Migration
  def change
    remove_column :collocs, :user_id, :integer
  end
end
