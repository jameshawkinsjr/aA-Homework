class RemoveIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index :toys, :toyable_id
  end
end
