class AddResolveToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :resolve, :boolean, default: false
  end
end
