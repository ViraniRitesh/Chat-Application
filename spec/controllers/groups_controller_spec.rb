require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }

  describe 'POST #add_user' do
    context 'when user is successfully added to the group' do
      it 'adds a user to the group' do
        post :add_user, params: { id: group.id, user_id: user.id }
        expect(response).to have_http_status(:ok)
        expect(group.users).to include(user)
      end
    end

    context 'when user is already in the group' do
      it 'returns an error' do
        group.users << user
        post :add_user, params: { id: group.id, user_id: user.id }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
