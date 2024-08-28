require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should have_many(:group_users) }
  it { should have_many(:users).through(:group_users) }
  it { should have_many(:messages).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end
