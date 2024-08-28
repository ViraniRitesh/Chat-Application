require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:conversation) { create(:conversation, sender: user, receiver: other_user) }
  let!(:group) { create(:group) }

  describe 'POST #create' do
    context 'when user is found' do
      it 'creates a new message in a conversation' do
        post :create, params: {
          user_id: user.id,
          conversation_id: conversation.id,
          message: { content: 'Hello' }
        }

        expect(response).to have_http_status(:created)
        expect(Message.last.content).to eq('Hello')
      end
    end

    context 'when user is not found' do
      it 'returns an error' do
        post :create, params: {
          user_id: 999,
          conversation_id: conversation.id,
          message: { content: 'Hello' }
        }

        expect(response).to have_http_status(:not_found)
        expect(response.body).to include('User not found')
      end
    end
  end
end
