class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :title
      t.text :image_id
      t.integer :price
      t.string :label
      t.integer :stock
      t.date :release
      t.string :introduction
      t.integer :artist_id
      t.integer :category_id
      t.integer :anime_id

      t.timestamps
    end
  end
end
