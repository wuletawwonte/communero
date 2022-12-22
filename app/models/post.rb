class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :comments

  validates :title, :body, presence: :true

  enum :status, { draft: 0, published: 1 }
end
