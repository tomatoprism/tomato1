class AddTitleToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :title, :string
  end
end
