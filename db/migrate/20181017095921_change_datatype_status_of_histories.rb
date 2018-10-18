class ChangeDatatypeStatusOfHistories < ActiveRecord::Migration[5.2]
  def change
  	change_column :histories, :status, :integer
  end
end
