# == Schema Information
#
# Table name: members
#
#  id         :bigint           not null, primary key
#  role       :string           not null
#  user_id    :bigint           not null
#  group_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Member < ApplicationRecord
  belongs_to :user
  belongs_to :group
end
