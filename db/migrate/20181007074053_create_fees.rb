class CreateFees < ActiveRecord::Migration[5.2]
  def change
    create_table :fees do |t|
    # create_table :fees, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :prefecture_id
      t.integer :fee

      t.timestamps
    end
  end
end
