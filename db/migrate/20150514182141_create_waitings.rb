class CreateWaitings < ActiveRecord::Migration
  def change
    create_table :waitings do |t|
      t.string :email
      t.references :colloc

      t.timestamps null: false
    end
  end
end
