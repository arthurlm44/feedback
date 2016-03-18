class ReviewsController < ApplicationController

  def index
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
