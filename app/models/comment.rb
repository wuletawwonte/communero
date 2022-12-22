class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :sub_comments, dependent: :destroy

  validates :content, presence: :true
end
