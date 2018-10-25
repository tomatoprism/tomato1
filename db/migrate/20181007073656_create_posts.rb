class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    # create_table :posts, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :post_address
      t.string :post_code
      t.integer :user_id
      t.integer :postage_id

      t.timestamps
    end
  end
end
