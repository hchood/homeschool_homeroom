require 'spec_helper'

describe User do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  it { should have_many(:memberships).dependent(:destroy) }
  it { should have_many(:groups).through(:memberships) }

  # it { should validate_presence_of :username }
  # it { should validate_uniqueness_of :username }
end
