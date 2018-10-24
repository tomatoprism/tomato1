class CreateProductCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_categories do |t|
    # create_table :product_categories, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.integer :product_id
    	t.integer :category_id

      t.timestamps
    end
  end
end
