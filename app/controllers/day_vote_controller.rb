class DayVoteController < ApplicationController
  require 'json'

  def create
    # if @user_group.clickon class day
      @vote = Vote.new(vote_params)
    # end
  end

  def destroy
    # if @user_group.clickon class day is already chosen
      @vote = Vote.find(params[:id])
      @vote.destroy
    # end
  end
end
