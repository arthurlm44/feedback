class DefaultRatingCountOnReviews < ActiveRecord::Migration
  def change
    change_column_default(:reviews, :rating_count, 0)
  end
end
