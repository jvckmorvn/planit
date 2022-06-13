class DayVoteController < ApplicationController
  require 'json'

  def create
    # if @user_group.clickon class day
      @day = Day.find(params[:day_id])
      @vote = DayVote.create(day: @day, user: current_user)
      redirect_to group_path(@day.event.group)
    # end
  end

  def destroy
    # if @user_group.clickon class day is already chosen
      @vote = Vote.find(params[:id])
      @vote.destroy
    # end
  end
end
