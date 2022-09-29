class RemoveIdsFromMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :conversation_id, :integer
    remove_column :messages, :user_id, :integer
  end
end
