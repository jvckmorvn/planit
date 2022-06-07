class Group < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
  has_many :user_groups
  has_many :users, through: :user_groups
end
