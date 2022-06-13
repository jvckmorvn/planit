class Day < ApplicationRecord
  belongs_to :event
  has_many :day_votes, dependent: :destroy
end

# e.g.
# <div class="day">
#   <div style="width: 30px; height: 30px; border-radius: 50%; background-color: <%= day.date_marker.colour %>; opacity: <%= day.date_marker.opacity %>"></div>
# </div>
