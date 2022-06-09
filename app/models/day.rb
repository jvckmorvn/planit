class Day < ApplicationRecord
  belongs_to :event
  has_many :day_votes, dependent: :destroy

  def change_opacity
    group = self.event.group
    colour = self.event.colour
    user_ids = UserGroup.where(group: group).distinct.pluck(:user_id)
    user_count = user_ids.count
    p user_count
    # for each day in event, find number of votes
    # divide total no. of day_votes by user_count
    # round result to nearest tenth
    # use result to set opacity value in style attribute of div containing each day
  end
end
