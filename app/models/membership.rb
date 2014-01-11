class Membership < ActiveRecord::Base
  validates_presence_of :member_id
  validates_presence_of :group_id

  belongs_to :member, class_name: 'User', foreign_key: 'member_id'
  belongs_to :group
end
