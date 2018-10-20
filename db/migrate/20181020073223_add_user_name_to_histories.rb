class AddUserNameToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :user_name, :string
  end
end
