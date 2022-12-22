class Group < ApplicationRecord
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_many :posts, dependent: :destroy

  validates :name, presence: true
end
