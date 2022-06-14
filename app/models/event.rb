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
  
  COLOURS = ["crimson", "olivedrab", "royalblue", "orange", "orchid"]

  def rgba_colour(opacity)
    case self.colour
    when "crimson"
      return "rgba(220, 20, 60, #{opacity});"
    when "olivedrab"
      return "rgba(107, 142, 35, #{opacity});"
    when "royalblue"
      return "rgba(65, 105, 225, #{opacity});"
    when "orange"
      return "rgba(255, 165, 0, #{opacity});"
    when "orchid"
      return "rgba(202, 99, 198, #{opacity});"
    end
  end
end
