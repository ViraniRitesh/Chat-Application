class AddGroupToMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :group, foreign_key: true
  end
end
