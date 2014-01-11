require 'spec_helper'

describe Membership do
  it { should validate_presence_of :member_id }
  it { should validate_presence_of :group_id }

  it { should belong_to(:member).class_name('User').with_foreign_key(:member_id) }
  it { should belong_to :group }
end
