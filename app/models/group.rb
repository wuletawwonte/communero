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

  

  def members_count
    "#{self.members.count} Members"
  end

  def posts_count
    "#{self.posts.count} Posts"
  end

  def created_by(user)
    true if self.user == user
  end

  def is_not_member(user_id)
    if self.members.where(user_id: user_id).blank?
      return true
    else
      return false
    end
  end

  private

  def add_member
    members.create(role: "creator", user:, group: self)
  end
end
