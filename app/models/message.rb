class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :conversation, optional: true
  belongs_to :group, optional: true
end
