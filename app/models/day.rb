class Day < ApplicationRecord
  belongs_to :event
  has_many :day_votes, dependent: :destroy

  def date_marker
    # calculate number of users in current group
    group = self.event.group
    user_ids = UserGroup.where(group: group).distinct.pluck(:user_id)
    user_count = user_ids.count
    # divide total no. of day_votes for each day by number of users in the group
    if self.day_votes == 0
      opacity = 0
    else
      ratio = self.day_votes / user_count
    # round result to nearest tenth
      opacity = ratio.round(1)
    end
    # use result to set opacity value in inline style attribute of circular marker div within each day
    return opacity
  end
end

# e.g.
# <div class="day">
#   <div style="width: 30px; height: 30px; border-radius: 50%; background-color: <%= day.date_marker.colour %>; opacity: <%= day.date_marker.opacity %>"></div>
# </div>
