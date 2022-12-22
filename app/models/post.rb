class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group

  enum :status, { draft: 0, published: 1 }
end
