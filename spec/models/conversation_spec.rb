require 'rails_helper'

RSpec.describe Conversation, type: :model do
  it { should belong_to(:sender).class_name('User') }
  it { should belong_to(:receiver).class_name('User') }
  it { should have_many(:messages) }
  it { should validate_uniqueness_of(:sender_id).scoped_to(:receiver_id) }

  describe '.between' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let!(:conversation) { create(:conversation, sender: user1, receiver: user2) }

    it 'returns the conversation between two users' do
      expect(Conversation.between(user1.id, user2.id)).to include(conversation)
    end
  end
end
