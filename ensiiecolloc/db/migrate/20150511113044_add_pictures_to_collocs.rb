class AddPicturesToCollocs < ActiveRecord::Migration
  def change
    add_column :collocs, :pictures, :json
  end
end
