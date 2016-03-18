class Statement < ActiveRecord::Base
  has_many :reviews, through: :statement_scores
end
