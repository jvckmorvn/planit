class DayVoteController < ApplicationController
  require 'json'

  def create
    @day = Day.find(params[:day_id])
      unless @day.event.day_votes.where(user: current_user).count > 0
        @vote = DayVote.create(day: @day, user: current_user)
      else
        flash[:alert] = "Sorry, you can only vote for one date per event."
      end
      redirect_to group_path(@day.event.group)
  end

  def destroy
    @vote = DayVote.find(params[:id])
      @vote.destroy
      redirect_to group_path(@vote.day.event.group), status: :see_other
  end
end
