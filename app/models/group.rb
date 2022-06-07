class Group < ApplicationRecord
  has_one_attached :picture
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
end
