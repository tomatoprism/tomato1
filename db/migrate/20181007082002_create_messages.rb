class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
    # create_table :messages, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.string :mail
      t.string :text

      t.timestamps
    end
  end
end
