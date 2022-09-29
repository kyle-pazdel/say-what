class AddReferencesToMessages < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :user, index: true
    add_reference :messages, :conversation, index: true
    change_column_default :messages, :read, from: nil, to: false
  end
end
