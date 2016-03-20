class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def index
    @reviews = Review.where(user_id: current_user.id).where('rating_count >= 2').order('updated_at DESC')

    @review_scores = {}
    @reviews.each do |review|
      score_hash = {}
      review.statement_scores.each do |statement_score|
        score_hash[statement_score.statement_id] = statement_score.score
      end
      @review_scores[review.id] = score_hash
    end

    @reviews_by_user = Review.where(reviewer_id: current_user.id).where('rating_count >= 2')
    @meta_scores = {}
    @reviews_by_user.each do |review|
      rating_totals = {}
      rating_totals['specificity'] = {1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0}
      rating_totals['actionability'] = {1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0}
      rating_totals['kindness'] = {1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0}
      ratings = review.ratings
      ratings.each do |rating|
        rating_totals['specificity'][rating.specificity] += 1
        rating_totals['actionability'][rating.actionability] += 1
        rating_totals['kindness'][rating.kindness] += 1
      end
      @meta_scores[review.id] = rating_totals
    end
  end

  def new
    @review = Review.new
    @reviewer = current_user
    @users = User.all.reject { |u| u.id == @reviewer.id }
    @statements = Statement.all
    @statements.each { |statement| @review.statement_scores.build(statement_id: statement.id) }
  end

  def create
    review = Review.new(review_params)
    if review.save
      flash[:notice] = 'Great success! Niiiice, I like'
      redirect_to root_path
    else
      flash[:notice] = 'You dun messed up'
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :user_id, :reviewer_id, statement_scores_attributes: [:statement_id, :score])
  end
end
