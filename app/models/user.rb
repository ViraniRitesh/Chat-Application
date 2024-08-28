class User < ApplicationRecord
  has_many :messages
  has_many :sent_conversations, class_name: 'Conversation', foreign_key: 'sender_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'receiver_id'
  has_many :group_users
  has_many :groups, through: :group_users
end
