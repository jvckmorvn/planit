class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about]

  def home
    @hide_nav = true
    redirect_to groups_path if user_signed_in?
  end

  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @events = Event.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @events = Event.where(starts_at: start_date.beginning_of_week..start_date.end_of_week)
  end

  def about
  end
end
