require 'spec_helper'

describe User do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  it { should have_many(:memberships).dependent(:destroy) }
  it { should have_many(:groups).through(:memberships) }
  it { should have_many(:topics) }

  # it { should validate_presence_of :username }
  # it { should validate_uniqueness_of :username }


  describe '.is_member_of' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:group) { FactoryGirl.create(:group) }

    it 'returns true if the user is a member of the group' do
      expect(user.is_member_of(group)).to be_false
    end

    it 'returns false if user is not a member' do
      Membership.create(member: user, group: group)
      expect(user.is_member_of(group)).to be_true
    end
  end

  describe '.name' do
    it "returns the user's full name" do
      user = FactoryGirl.create(:user)

      expect(user.name).to eq "#{user.first_name} #{user.last_name}"
    end
  end
end
