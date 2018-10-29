class CreatePostages < ActiveRecord::Migration[5.2]
  def change
    create_table :postages, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :postage
      t.integer :post_id
      t.integer :prefecture_id

      t.timestamps
    end
  end
end
