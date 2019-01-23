class AddTimestampsToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :name, :string
  end
end
