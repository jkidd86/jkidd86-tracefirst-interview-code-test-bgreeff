class AddDiscardedAtToAnimals < ActiveRecord::Migration[8.1]
  def change
    add_column :animals, :discarded_at, :datetime
    add_index :animals, :discarded_at
  end
end
