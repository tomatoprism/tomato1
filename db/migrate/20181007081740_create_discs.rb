class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :product_id
      t.string :disc_name

      t.timestamps
    end
  end
end
