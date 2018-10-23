class AddSubtotalToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :subtotal, :integer
  end
end
