class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :music
      t.integer :list_num
      t.integer :disc_id

      t.timestamps
    end
  end
end
