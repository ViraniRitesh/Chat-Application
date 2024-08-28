require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:sent_conversations).class_name('Conversation').with_foreign_key('sender_id') }
  it { should have_many(:received_conversations).class_name('Conversation').with_foreign_key('receiver_id') }
  it { should have_many(:messages) }
  it { should have_many(:group_users) }
  it { should have_many(:groups).through(:group_users) }
end
