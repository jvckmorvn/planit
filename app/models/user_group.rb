class UserGroup < ApplicationRecord
  belongs_to :group
  belongs_to :user
  accepts_nested_attributes_for :user
end
