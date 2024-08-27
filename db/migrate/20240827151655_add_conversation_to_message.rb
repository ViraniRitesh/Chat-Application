class AddConversationToMessage < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :conversation, index: true
  end
end
