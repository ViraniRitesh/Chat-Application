require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should belong_to(:user).optional }
  it { should belong_to(:conversation).optional }
  it { should belong_to(:group).optional }
end
