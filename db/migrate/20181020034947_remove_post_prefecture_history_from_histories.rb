class RemovePostPrefectureHistoryFromHistories < ActiveRecord::Migration[5.2]
  def change
    remove_column :histories, :post_prefecture_history, :string
  end
end
