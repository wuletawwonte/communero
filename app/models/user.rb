# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  admin                  :boolean          default(FALSE), not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups, through: :members, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: { allow_blank: false }

  def initials
    "#{first_name.strip.chr.upcase}#{last_name.strip.chr.upcase}"
  end

  def avatar_color
    colors = %w[orange lime green teal cyan sky violet fuchsia pink]
    colors[id % colors.size]
  end
end
