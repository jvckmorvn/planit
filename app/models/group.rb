class Group < ApplicationRecord
  has_one_attached :picture
  has_many :user_groups
  has_many :users, through: :user_group
end
