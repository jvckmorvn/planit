class Day < ApplicationRecord
  belongs_to :event
  has_many :day_votes
end
