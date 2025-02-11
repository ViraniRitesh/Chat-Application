class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end
