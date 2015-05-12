class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :colloc_id
      t.string :path
      t.string :thumb

      t.timestamps null: false
    end
  end
end
