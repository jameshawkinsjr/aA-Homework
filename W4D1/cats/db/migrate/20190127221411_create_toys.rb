class CreateToys < ActiveRecord::Migration[5.2]
  def change
    create_table :toys do |t|
      t.integer :cat_id, null: false
      t.string :name, null: false
      t.string :ttype, null: false
      t.timestamps
    end
  end
end