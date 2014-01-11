class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :password

  has_many :memberships, foreign_key: 'member_id', dependent: :destroy
  has_many :groups, through: :memberships
  has_many :topics, foreign_key: 'author_id'

  def name
    "#{first_name} #{last_name}"
  end

  def is_member_of(group)
    membership = Membership.where(member: self, group: group)
    if membership.empty?
      false
    else
      true
    end
  end
end
