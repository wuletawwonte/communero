# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  body       :text             not null
#  status     :integer          default("draft"), not null
#  user_id    :bigint           not null
#  group_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :comments

  validates :title, :body, presence: true

  enum :status, { draft: 0, published: 1 }
end
