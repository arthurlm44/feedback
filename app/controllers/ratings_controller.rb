class RatingsController < ApplicationController

  before_action :authenticate_user!

  def new
    @rating = Rating.new
    blacklist = Rating.where(user_id: current_user.id).pluck(:review_id)
    if blacklist.length > 0
      @next_up = Review.where.not(reviewer_id: current_user.id).where.not(user_id: current_user.id).where("id NOT IN (?)", blacklist).where('rating_count < ?', 2).order('created_at ASC').first
    else
      @next_up = Review.where.not(reviewer_id: current_user.id).where.not(user_id: current_user.id).where('rating_count < ?', 2).order('created_at ASC').first
    end

  end

  def create
    rating = Rating.new(rating_params)
    if rating.save
      flash[:notice] = 'Great success! Niiiice, I like'
      redirect_to new_rating_path
    else
      flash[:notice] = 'You dun messed up'
    end
  end


  private
  def rating_params
    params.require(:rating).permit(:review_id, :user_id, :specificity, :actionability, :kindness)
  end
end