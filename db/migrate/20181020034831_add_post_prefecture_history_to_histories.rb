class AddPostPrefectureHistoryToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :post_prefecture_history, :string
  end
end
