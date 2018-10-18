class AddDeletedAtToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :deleted_at, :datetime
    add_index :histories, :deleted_at
  end
end
