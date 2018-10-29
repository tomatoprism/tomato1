class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :text
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
