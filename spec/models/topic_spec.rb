require 'spec_helper'

describe Topic do
  it { should validate_presence_of :author_id }
  it { should validate_presence_of :group_id }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }

  it { should belong_to :group }
  it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
end
