class RemoveMailFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :mail, :string
  end
end
