class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups, through: :members, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :email, :uniqueness => {:allow_blank => false}
end
