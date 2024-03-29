# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Group < ApplicationRecord
  after_create :add_member
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :filter_by_user, ->(user) { where(user_id: user.id) }
  scope :filter_by_contains, ->(user) { joins(:members).where(members: { user_id: user.id }) }

  def members_count
    "#{members.count} Members"
  end

  def posts_count
    "#{posts.count} Posts"
  end

  def created_by(user)
    true if self.user == user
  end

  def not_member(user_id)
    members.where(user_id:).blank?
  end

  def member_id(user_id)
    members.where(members: { user_id: }).pluck(:id)
  end

  private

  def add_member
    members.create(role: 'creator', user:, group: self)
  end
end
