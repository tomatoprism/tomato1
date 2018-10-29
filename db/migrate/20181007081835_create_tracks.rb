class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :music
      t.integer :list_num
      t.integer :disc_id

      t.timestamps
    end
  end
end
