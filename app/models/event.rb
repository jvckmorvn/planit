class Event < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :days, dependent: :destroy
  has_many :day_votes, through: :days
end
