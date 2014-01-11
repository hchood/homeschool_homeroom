class Group < ActiveRecord::Base
  validates_presence_of :organizer_id
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :description

  validates_uniqueness_of :name

  belongs_to :organizer, class_name: 'User', foreign_key: 'organizer_id'
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships, foreign_key: 'member_id'
  has_many :topics, dependent: :destroy
end
