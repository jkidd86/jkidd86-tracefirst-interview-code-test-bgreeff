class AddDiscardedAtToVeterinarians < ActiveRecord::Migration[8.1]
  def change
    add_column :veterinarians, :discarded_at, :datetime
    add_index :veterinarians, :discarded_at
  end
end
