class CreateTables < ActiveRecord::Migration[6.1]
  def change

    create_table :messages do |t|
      t.text :content, null: false
      t.string :traceur
      t.string :statut, default: "standby"
      t.timestamps
    end

    create_table :messagecommits do |t|
      t.text :content, null: false
      t.string :traceur
      t.string :statut, default: "standby"
      t.timestamps
    end

  end
end
