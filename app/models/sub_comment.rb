# == Schema Information
#
# Table name: sub_comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  comment_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SubComment < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  validates :content, presence: true
end
