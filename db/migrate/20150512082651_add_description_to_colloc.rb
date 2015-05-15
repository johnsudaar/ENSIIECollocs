class AddDescriptionToColloc < ActiveRecord::Migration
  def change
    add_column :collocs, :description, :string
  end
end
