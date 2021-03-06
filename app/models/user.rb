class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  validates :username, uniqueness: true
  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups
  has_many :events, dependent: :destroy
end
