class UserGroup < ApplicationRecord
  belongs_to :group
  belongs_to :user
  accepts_nested_attributes_for :user
  validates :user_id, uniqueness: { scope: :group_id, message: "This user has already been added to this group." }
end
