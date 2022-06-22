class DayVoteController < ApplicationController
  require 'json'

  def create
    @day = Day.find(params[:day_id])
    if @day.event.day_votes.where(user: current_user).count.positive?
      flash[:alert] = "Sorry, you can only vote for one date per event."
    else
      @vote = DayVote.create(day: @day, user: current_user)
    end
    redirect_to group_path(@day.event.group)
  end

  def destroy
    @vote = DayVote.find(params[:id])
    @vote.destroy
    redirect_to group_path(@vote.day.event.group), status: :see_other
  end
end
