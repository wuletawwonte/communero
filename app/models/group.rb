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

  def created_by(current_user)
    true if self.user == current_user
  end
end
