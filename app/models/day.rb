class Day < ApplicationRecord
  belongs_to :event
  has_many :day_votes, dependent: :destroy

  def change_opacity
  end
end
