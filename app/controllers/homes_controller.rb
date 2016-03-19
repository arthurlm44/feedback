class HomesController < ApplicationController
  def index
    redirect_to user_session_path unless user_signed_in?
  end
end
