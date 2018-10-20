class AddPrefectureHistoryToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :prefecture_history, :string
  end
end
