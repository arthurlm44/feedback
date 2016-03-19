class Statement < ActiveRecord::Base
  has_many :statement_scores
  has_many :reviews, through: :statement_scores
end
