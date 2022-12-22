class SubComment < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  validates :content, presence: true
end
