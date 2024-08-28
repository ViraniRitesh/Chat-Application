require 'rails_helper'

RSpec.describe GroupUser, type: :model do
  let(:group) { create(:group) }
  let(:user) { create(:user) }
  before { create(:group_user, group: group, user: user) }

  it { should validate_uniqueness_of(:user_id).scoped_to(:group_id) }
end
