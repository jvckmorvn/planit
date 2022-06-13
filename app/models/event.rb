class Event < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :days, dependent: :destroy
  has_many :day_votes, through: :days
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :colour, presence: true
  validates :colour, uniqueness: { scope: :group_id, message: "This colour has already been taken." }
  validates :name, presence: true
  validates :name, uniqueness: { scope: :group_id, message: "This name has already been taken." }
  validates :proposed_start_date, presence: true
  validates :proposed_end_date, presence: true
  validates :address, presence: true
  COLOURS = ["maroon", "darkgreen", "midnightblue", "darkorange", "purple"]
end
