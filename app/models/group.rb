class Group < ApplicationRecord
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :users, through: :members 

  validates :name, presence: true
end
