class Topic < ActiveRecord::Base
  validates_presence_of :author_id
  validates_presence_of :group_id
  validates_presence_of :name
  validates_presence_of :description

  belongs_to :group
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
