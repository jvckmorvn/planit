class DayVote < ApplicationRecord
  belongs_to :day
  belongs_to :user
end
