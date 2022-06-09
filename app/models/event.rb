class Event < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :days, dependent: :destroy
  has_many :day_votes, through: :days
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :colour, uniqueness: { scope: :group_id, message: "This colour has already been taken" }
  COLOURS = ["red", "green", "blue", "yellow", "grey"]
end
