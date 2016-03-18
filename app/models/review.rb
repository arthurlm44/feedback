class Review < ActiveRecord::Base
  belongs_to :user
  has_many :statements, through: :statement_scores
  has_many :ratings
end
