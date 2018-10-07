class CreateFees < ActiveRecord::Migration[5.2]
  def change
    create_table :fees do |t|
      t.string :prefecture_id
      t.integer :fee

      t.timestamps
    end
  end
end
