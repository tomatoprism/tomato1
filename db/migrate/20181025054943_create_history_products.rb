class CreateHistoryProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :history_items, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :title
      t.integer :quantity
      t.integer :subtotal
      t.integer :history_id

      t.timestamps
    end
  end
end