class AddLatitudeAndLongitudeToColloc < ActiveRecord::Migration
  def change
    add_column :collocs, :latitude, :float
    add_column :collocs, :longitude, :float
  end
end
