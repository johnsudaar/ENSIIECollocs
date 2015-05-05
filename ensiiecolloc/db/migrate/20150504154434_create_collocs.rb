class CreateCollocs < ActiveRecord::Migration
  def change
    create_table :collocs do |t|
      t.string :titre
      t.string :adresse
      t.float :size
      t.integer :places
      t.integer :max_people
      t.float :price

      t.timestamps null: false
    end
  end
end
