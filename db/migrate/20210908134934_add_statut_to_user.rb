class AddStatutToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :statut, :string, null: false, default: "noadmin"
  end
end
