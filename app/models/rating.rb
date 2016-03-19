class Rating < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  after_save :update_rating_count

  def update_rating_count
    review = Review.find(self.review_id)
    review.rating_count += 1
    review.save
  end
end
