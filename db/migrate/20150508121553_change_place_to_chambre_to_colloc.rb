class ChangePlaceToChambreToColloc < ActiveRecord::Migration
  def change
    rename_column :collocs, :places, :chambres
  end
end
