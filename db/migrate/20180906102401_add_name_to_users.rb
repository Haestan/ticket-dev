class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pseudo, :string
  end
end
