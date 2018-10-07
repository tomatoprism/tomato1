class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :cart_id
      t.string :status
      t.integer :price_history
      t.string :post_address_history
      t.string :post_code_history

      t.timestamps
    end
  end
end
