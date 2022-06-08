class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @hide_nav = true
#  redirect_to groups_path if user_signed_in?

  end
end
