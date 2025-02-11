class Conversation < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :messages

  validates :sender_id, uniqueness: {scope: :receiver_id}

  def self.between(sender_id, receiver_id)
  	where(sender_id: sender_id, receiver_id: receiver_id).or(where(sender_id: receiver_id, receiver_id: sender_id))
  end
end
