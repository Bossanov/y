class AddReferenceToMessage < ActiveRecord::Migration[6.1]
  def change
add_reference :messagecommits, :message, foreign_key: true, index: true
  end
end
